
import $ from 'jquery';
import BpmnModeler from 'bpmn-js/lib/Modeler';
//import propertiesPanelModule from '../resources/properties-panel';
import propertiesPanelModule from 'bpmn-js-properties-panel';
import propertiesProviderModule from '../resources/properties-panel/provider/activiti';
import activitiModdleDescriptor from '../resources/activiti.json';
import customTranslate from '../resources/customTranslate/customTranslate';
import customControlsModule from '../resources/customControls';
import tools from '../resources/tools'
import diagramXML from '../resources/newDiagram.bpmn';
const proHost = window.location.protocol + "//" + window.location.host;
const href = window.location.href.split("bpmnjs")[0];
const key = href.split(window.location.host)[1];
const publicurl = proHost + key;

var modelId = "";
//当前选中的task
window.currentTaskShape;
//最近创建的task
window.addedTask;

// 添加翻译组件
var customTranslateModule = {
  translate: ['value', customTranslate]
};
debugger
var container = $('#js-drop-zone');
var canvas = $('#js-canvas');
window.bpmnModeler = new BpmnModeler({
  container: canvas,
  propertiesPanel: {
    parent: '#js-properties-panel'
  },
  additionalModules: [
    propertiesPanelModule,
    propertiesProviderModule,
    customControlsModule,
    customTranslateModule
  ],
  moddleExtensions: {
    activiti:activitiModdleDescriptor
  }
});
container.removeClass('with-diagram');
// 判断浏览器支持程度
if (!window.FileList || !window.FileReader) {
  window.alert('请使用谷歌、火狐、IE10+浏览器');
} else {
  tools.registerFileDrop(container, tools.createDiagram(diagramXML, bpmnModeler, container));
}


$(function () {
  clickTask();
  clickFormKey();
  shapeAdded();
  rootChangeReSetForm();
  // 创建bpmn
  debugger
  var param = tools.getUrlParam(window.location.href)
  $('.item').show()
  //modelId = param.modelId;
  if (!param || param.type === 'addBpmn') {
    tools.createDiagram(diagramXML, bpmnModeler, container);
  } else if(param.type === 'edit'){
    const Id = param.modelId;
    var param={
      "modelId":Id
    }
    $.ajax({
      url: publicurl+'act/definition/model/getBpmnXML',
      type: 'GET',
      data: param,
      dataType:'text',
      success: function (result) {
        var newXmlData = result

        tools.createDiagram(newXmlData, bpmnModeler, container);
        /*setTimeout(function () {
            for (var i in ColorJson) {
                tools.setColor(ColorJson[i],bpmnModeler)
            }
        }, 200)*/
      },
      error: function (err) {
        console.log(err)
      }
    });
  } else if (param.type === 'lookBpmn') { //编辑bpmn
    debugger
    $('.item').hide()
    $('.download').show()
    const Id = param.deploymentFileUUID || '6d4af2dc-bab0-11ea-b584-3cf011eaafca'
    const Name=param.deploymentName || 'String.bpmn'
    const instanceId=param.instanceId
    var param={
      "deploymentId":Id,
      "resourceName":decodeURI(Name)
    }
    if(instanceId){
      var param1={
        instanceId
      }
      $.ajax({
        url: publicurl+'activitiHistory/gethighLine',
        type: 'GET',
        data: param1,
        dataType:'json',
        success: function (result) {
          var ColorJson=tools.getByColor(result.obj)
          $.ajax({
            url: publicurl+'processDefinition/getDefinitionXML',
            type: 'GET',
            data: param,
            dataType:'text',
            success: function (result) {
              var newXmlData = result
              tools.createDiagram(newXmlData, bpmnModeler, container);
              setTimeout(function () {
                for (var i in ColorJson) {
                  tools.setColor(ColorJson[i],bpmnModeler)
                }
              }, 200)
            },
            error: function (err) {
              console.log(err)
            }
          });
        },
        error: function (err) {
          console.log(err)
        }
      });
    }else{
      //加载后台方法获取xml
      $.ajax({
        url: publicurl+'processDefinition/getDefinitionXML',
        type: 'GET',
        data: param,
        dataType:'text',
        success: function (result) {
          var newXmlData = result
          tools.createDiagram(newXmlData, bpmnModeler, container);
        },
        error: function (err) {
          console.log(err)
        }
      });
    }
  } else if(param.type === "historyBpmn") { // bpmn历史
    $('.item').hide()
    $('.download').show()
  }
  // 点击新增
  $('#js-download-diagram').on("click", function () {
    tools.syopen('alert')
  })

  // 点击取消
  $('.cancel').on("click",function () {
    tools.syhide('alert')
  })
  // 点击确定
  $('#sure').on('click',function(){
    // const text=$("#deploymentName").val()
    tools.saveBpmn(bpmnModeler)
  })



  // 点击下载
  $("#downloadBpmn").on("click", function () {
    tools.downLoad(bpmnModeler)
  })
  // 点击上传
  $("#uploadFile").on("change", function () {
    console.log(1);
    tools.upload(bpmnModeler,container)
  })
  // 点击保存
  $("#saveBpmnModel").on("click", function () {
    console.log(1);
    //tools.saveBpmnModel(bpmnModeler, modelId)
    tools.saveBpmnModel(formData, bpmnModeler)
  })

  function clickFormKey() {

    $("#js-properties-panel").on("click", "#activiti-form-key", function(){
      var shape = window.currentTaskShape
      const modeling = bpmnModeler.get('modeling');
      // modeling.updateProperties(shape, {
      //   formKey: "abc"
      // })
      window.parent.$.modal.open("流程节点表单选择", "/act/definition/model/taskFormSelect");
    })
  }

  function clickTask() {
    const eventBus = bpmnModeler.get('eventBus') // 需要使用eventBus
    var elementRegistry = bpmnModeler.get('elementRegistry')
    const eventTypes = ['element.click'] // 需要监听的事件集合
    eventTypes.forEach(function(eventType) {
      eventBus.on(eventType, function(e) {
        var shape = e.element ? elementRegistry.get(e.element.id) : e.shape;
        if(shape.type == 'bpmn:UserTask'){
          window.currentTaskShape=shape;
        } else {
          window.currentTaskShape=null;
        }
        window.addedTask=null;
      })
    })
  }

  function rootChangeReSetForm() {
    const eventBus = bpmnModeler.get('eventBus') // 需要使用eventBus
    var elementRegistry = bpmnModeler.get('elementRegistry')
    const eventTypes = ['element.changed'] // 需要监听的事件集合
    eventTypes.forEach(function(eventType) {
      eventBus.on(eventType, function(e) {
        if (e && e.element.type == 'bpmn:Process'){
          var shape = e.element ? elementRegistry.get(e.element.id) : e.shape;
          var o = shape.businessObject;
          var processKey = o.id;
          var name = o.name;
          window.parent.document.getElementById("processKey").value = processKey;
          window.parent.document.getElementById("name").value = name;
        }
      })
    })
  }

  function shapeAdded() {
    const eventBus = bpmnModeler.get('eventBus') // 需要使用eventBus
    var elementRegistry = bpmnModeler.get('elementRegistry')
    const eventTypes = ['shape.added'] // 需要监听的事件集合
    eventTypes.forEach(function(eventType) {
      eventBus.on(eventType, function(e) {
        var shape = e.element ? elementRegistry.get(e.element.id) : e.shape;
        if(shape.type == 'bpmn:UserTask'){
          window.addedTask=shape;
        } else {
          window.addedTask=null;
        }
        window.currentTaskShape=null;
      })
    })

  }
});
