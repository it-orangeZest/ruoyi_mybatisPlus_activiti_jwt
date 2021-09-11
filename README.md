这是一款基于若依框架，扩展的activiti工作流平台，实现了动态外挂表单、零代码创建流程。
此项目是对我相关学习的总结以及对自己想法的实践与实现，发布出来是希望能帮助到有需要的人。
此项目只是提供基础、核心功能，投入时间有限，难免有设计不可理或bug的存在，望见谅。
参考：一只闲鹿的RuoYi-Activiti、慕课网汪汪队老师的activiti课程
技术栈：
    若依4.6.2相关技术栈 + mybatis-plus + activiti6 + bpmnjs
项目初始化步骤：
    1、导入项目，配置maven，修改application-druid.yml数据库配置
    2、创建数据库，执行项目根目录init文件夹下的ry_mp_activiti.sql文件
    3、修改application.yml中的database-schema-update为true，启动项目，自动创建activiti相关表，成功后database-schema-update改回false
    4、创建activiti用户、角色相关视图：执行项目根目录init文件夹下的view.sql文件
导入流程案例（可选）：
    1、启动项目，流程管理>>流程模型>>部署流程定义，上传项目根目录init文件夹下的bpmn.zip
    2、执行项目根目录init文件夹下的updateProcessModel.sql文件
    3、流程管理>>流程模型，删除任意一条数据（此时会全部删除，因为是同一次部署的）；流程管理>>流程模型，逐个点击部署
完成

整个项目的思路以及关键整合步骤我放到了《简书》上，地址https://www.jianshu.com/c/e272795a7e21