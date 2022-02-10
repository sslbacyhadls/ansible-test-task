#!/bin/sh
JAVA_OPTS="{{tomcat_java_opts}}"
{% if tomcat_jmx_enable %}
CATALINA_OPTS="$CATALINA_OPTS -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port={{tomcat_jmx_port|default(4447)}} -Dcom.sun.management.jmxremote.rmi.port={{tomcat_jmx_rmi_port|default(1100)}} -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Djava.rmi.server.hostname={{ansible_host}}"
{% endif %}
{% if tomcat_customopts is defined %}
CATALINA_OPTS="$CATALINA_OPTS {{tomcat_customopts}}"
{% endif %}
CLASSPATH=$CATALINA_HOME/lib/log4j2/log4j-api-2.11.1.jar:$CATALINA_HOME/lib/log4j2/log4j-jul-2.11.1.jar:$CATALINA_HOME/lib/log4j2/log4j-core-2.11.1.jar:$CATALINA_HOME/conf
LOGGING_MANAGER="-Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager"
JAVA_OPTS=$JAVA_OPTS -Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager
