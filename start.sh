#! /bin/sh
mkdir -p ${LOG_DIR}/${HOSTNAME}/dump ${LOG_DIR}/${HOSTNAME}/gc

exec java ${JAVA_AGENT} -jar \
  -XX:InitialRAMPercentage=80.0 -XX:MinRAMPercentage=80.0 -XX:MaxRAMPercentage=80.0 \
  -XX:-UseAdaptiveSizePolicy \
  -XX:+HeapDumpOnOutOfMemoryError \
  -XX:HeapDumpPath=${LOG_DIR}/${HOSTNAME}/dump/gateway/ \
  -XX:+PrintGCDetails \
  -XX:+PrintGCDateStamps \
  -Xloggc:${LOG_DIR}/${HOSTNAME}/gc/gateway.gc \
   ${CLASS_PATH}gateway.jar \
& java ${JAVA_AGENT_A} -jar \
    -XX:InitialRAMPercentage=80.0 -XX:MinRAMPercentage=80.0 -XX:MaxRAMPercentage=80.0 \
    -XX:-UseAdaptiveSizePolicy \
    -XX:+HeapDumpOnOutOfMemoryError \
    -XX:HeapDumpPath=${LOG_DIR}/${HOSTNAME}/dump/servicea/ \
    -XX:+PrintGCDetails \
    -XX:+PrintGCDateStamps \
    -Xloggc:${LOG_DIR}/${HOSTNAME}/gc/serviceA.gc \
     ${CLASS_PATH}serviceA.jar\
& java ${JAVA_AGENT_B} -jar \
    -XX:InitialRAMPercentage=80.0 -XX:MinRAMPercentage=80.0 -XX:MaxRAMPercentage=80.0 \
    -XX:-UseAdaptiveSizePolicy \
    -XX:+HeapDumpOnOutOfMemoryError \
    -XX:HeapDumpPath=${LOG_DIR}/${HOSTNAME}/dump/serviceb/ \
    -XX:+PrintGCDetails \
    -XX:+PrintGCDateStamps \
    -Xloggc:${LOG_DIR}/${HOSTNAME}/gc/serviceB.gc \
     ${CLASS_PATH}serviceB.jar


