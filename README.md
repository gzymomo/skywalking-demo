# skywalking-demo


> 日志集成参考文档 https://skywalking.apache.org/docs/skywalking-java/v8.9.0/en/setup/servi

## 本地调试

```shell
-javaagent:C:\Users\momo\Downloads\skywalking\apache-skywalking-java-agent-8.9.0\skywalking-agent\skywalking-agent.jar
-Dskywalking.agent.service_name=gateway
-Dskywalking.agent.namespace=test
-Dskywalking.collector.backend_service=127.0.0.1:49317
```

## 核心配置
**agent.service_name**: 服务名称, 可以采用 <group name>::<logic name>, 包含 <group name> ,拓扑图会自动显示分组 

**collector.backend_service**: oap服务端地址
## 配置优先级
配置覆盖

配置优先级, 每种配置功能一样, 没有区别, 不过存在优先级之分, 按如下顺序

### 1.系统属性 
例如 -Dskywalking.agent.service_name=abc
### 2.系统属性
使用 skywalking. + 配置文件中的配置名 作为系统属性的配置名来覆盖配置文件中的值。

### 3.探针参数, 
在 JVM 参数的探针路径后面增加配置,-javaagent:/.../skywalking-agent.jar=agent.service_name=abc,logging.level=debug, 多个用 ',' 分开, 如果值中包含 , = 则用 ""
系统环境变量, 例如在agent.config 中有配置, agent.service_name, 则使用值配置的名称SW_AGENT_NAME用来做环境变量, 对应关系如下
```shell
agent.service_name=${SW_AGENT_NAME:Your_ApplicationName}
logging.level=${SW_LOGGING_LEVEL:INFO}
# 使用环境变量覆盖
SW_AGENT_NAME=demo-application
SW_LOGGING_LEVEL=debug
```

### 4.agent.config 配置文件
