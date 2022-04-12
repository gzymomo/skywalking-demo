FROM openjdk:8-jre
LABEL maintainer=gzymomo

ENV SERVICE_NAME_LOCAL=skywalking-demo
ENV LOG_DIR=/opt/log/${SERVICE_NAME_LOCAL}/ \
    CLASS_PATH=/opt/skywalking-demo/ \
    PROGRAM_ARG="" \
    JAVA_AGENT="-javaagent:/opt/skywalking/agent/skywalking-agent.jar  -Dskywalking.agent.service_name=skywalking-demo::gateway -Dskywalking.agent.namespace=test -Dskywalking.collector.backend_service=skywalking-oap.skywalking:11800" \
    JAVA_AGENT_A="-javaagent:/opt/skywalking/agent/skywalking-agent.jar  -Dskywalking.agent.service_name=skywalking-demo::servicea -Dskywalking.agent.namespace=test -Dskywalking.collector.backend_service=skywalking-oap.skywalking:11800" \
    JAVA_AGENT_B="-javaagent:/opt/skywalking/agent/skywalking-agent.jar  -Dskywalking.agent.service_name=skywalking-demo::serviceb -Dskywalking.agent.namespace=test -Dskywalking.collector.backend_service=skywalking-oap.skywalking:11800"

EXPOSE 9000

ADD start.sh ./*/target/*.jar ${CLASS_PATH}

ENTRYPOINT /bin/sh ${CLASS_PATH}start.sh