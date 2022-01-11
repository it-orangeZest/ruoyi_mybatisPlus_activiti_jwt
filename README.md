 **年底工作太忙，项目有一段时间没更新。并且准备做一次重构，全方位的升级。--------2021-11-25** 

 **没想到获得了一些小伙伴的关注，但是我发现大家伙在部署和使用的时候存在一些问题，这也难免，因为首先需要对工作流有一定的了解，并且在使用的时候需要按照作者（也就是我）的设计套路去做，很多的使用套路和细节我没有向大家说明清楚，所以近期我准备录制一个视频，向大伙介绍一下如何部署和使用，并且会不定期更新和升级这个项目。
上有老下有小的程序员社畜，时间真的很紧张，请见谅** 

视频录制好了，质量不高，凑合着看。
链接：https://pan.baidu.com/s/1uOhNbGBD_5yhDWR8l6Uc0Q 
提取码：la61

------------------------------------- 割 --------------------------------------------------

这是一款基于若依框架，扩展的activiti工作流平台，实现了动态外挂表单、零代码创建流程。

此项目是对我相关学习的总结以及对自己想法的实践与实现，发布出来是希望能帮助到有需要的人。

此项目只是提供基础、核心功能，投入时间有限，难免有设计不合理或bug的存在，望见谅。

参考：一只闲鹿的RuoYi-Activiti、慕课网汪汪队老师的activiti课程

### 技术栈：

    若依4.6.2相关技术栈 + mybatis-plus + activiti6 + bpmnjs

### 项目初始化步骤：

    1、导入项目，配置maven，修改application-druid.yml数据库配置

    2、创建数据库，执行项目根目录init文件夹下的ry_mp_activiti.sql文件

    3、进入ruoyi-activiti模块下的resources\static\bpmnjs目录，依次执行npm install和npm run dev命令，耐心等待。注意：npm版本过高会报错，需降低版本，我的是6.13.4没问题。

    4、修改application.yml中的database-schema-update为true，启动项目，自动创建activiti相关表，成功后database-schema-update改回false

    5、创建activiti用户、角色相关视图：执行项目根目录init文件夹下的view.sql文件

### 导入流程案例（可选）：

    1、启动项目，流程管理>>流程模型>>部署流程定义，上传项目根目录init文件夹下的bpmn.zip

    2、执行项目根目录init文件夹下的updateProcessModel.sql文件

    3、流程管理>>流程管理，删除任意一条数据（此时会全部删除，因为是同一次部署的）；流程管理>>流程模型，逐个点击部署

完成

### 集成与改造过程分享
整个项目的思路、关键整合步骤以及功能显示我放到了《简书》上，地址https://www.jianshu.com/c/e272795a7e21 <br/>
感兴趣的小伙伴可以看看，其中包括：

    1、mybatis升级为mybatis-plus

    2、代码生成模板改造，适配mybatis-plus

    3、自动管理数据库表的公共字段

    4、集成activiti6

    5、集成bpmnjs及功能易用性改造

    6、手写表单编辑器


### 在线体验
权限没有做过多的限制，请尽量不要破坏现有数据<br/>
流程相关账号，密码都是111111<br/>
&emsp;&emsp;普通员工，账号：ttz&emsp;&emsp;角色：common<br/>
&emsp;&emsp;部门领导，账号：lj&emsp;&emsp;角色：sectionLead<br/>
&emsp;&emsp;人事，账号：gw&emsp;&emsp;角色：personnel<br/>
&emsp;&emsp;董事长，账号：hmxs&emsp;&emsp;角色：boss<br/>
地址：http://60.205.152.250/<br/>
服务器配置比较垃圾，响应会比较慢<br/>

### 演示图
<table>
    <tr>
        <td><img src="https://images.gitee.com/uploads/images/2021/0912/005456_60fc06d3_2195547.png"/></td>
        <td><img src="https://images.gitee.com/uploads/images/2021/0912/005734_2e6f301d_2195547.png"/></td>
    </tr>
    <tr>
        <td><img src="https://images.gitee.com/uploads/images/2021/0912/005830_d8c9fd01_2195547.png"/></td>
        <td><img src="https://images.gitee.com/uploads/images/2021/0912/005940_dfb8f9be_2195547.png"/></td>
    </tr>
    <tr>
        <td><img src="https://images.gitee.com/uploads/images/2021/0912/010015_19bbad5c_2195547.png"/></td>
        <td><img src="https://images.gitee.com/uploads/images/2021/0912/010115_f7b6470c_2195547.png"/></td>
    </tr>
    <tr>
        <td><img src="https://images.gitee.com/uploads/images/2021/0912/010229_367178ba_2195547.png"/></td>
        <td><img src="https://images.gitee.com/uploads/images/2021/0912/010314_9bae240d_2195547.png"/></td>
    </tr>
    <tr>
        <td><img src="https://images.gitee.com/uploads/images/2021/0912/010437_f3090873_2195547.png"/></td>
        <td><img src="https://images.gitee.com/uploads/images/2021/0912/010634_64dca843_2195547.png"/></td>
    </tr>
    <tr>
        <td><img src="https://images.gitee.com/uploads/images/2021/0912/010854_47f61ed0_2195547.png"/></td>
        <td><img src="https://images.gitee.com/uploads/images/2021/0912/010936_48c3df4c_2195547.png"/></td>
    </tr>
    <tr>
        <td><img src="https://images.gitee.com/uploads/images/2021/0912/011101_66abea54_2195547.png"/></td>
        <td><img src="https://images.gitee.com/uploads/images/2021/0912/011234_f47ede05_2195547.png"/></td>
    </tr>
    <tr>
        <td><img src="https://images.gitee.com/uploads/images/2021/0912/011254_4851d5f5_2195547.png"/></td>
        <td></td>
    </tr>
</table>
