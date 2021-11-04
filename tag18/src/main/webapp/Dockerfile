FROM	payara/server-full:5.2021.8-jdk11

ENV     \
        COMPILER_SOURCE_VM=11 \
        COMPILER_TARGET_VM=11
	   
COPY	tag18.war /opt/payara/appserver/glassfish/domains/domain1/autodeploy/

RUN     \
        sed -z -i.bak \
	 -e "s,\(compilerSourceVM</param-name>\n[ \t]*<param-value>\).*<,\1${COMPILER_SOURCE_VM}<,mg" \
	 -e "s,\(compilerTargetVM</param-name>\n[ \t]*<param-value>\).*<,\1${COMPILER_TARGET_VM}<,mg" \
	 /opt/payara/appserver/glassfish/domains/domain1/config/default-web.xml && \
	echo '+++ changes to /opt/payara/appserver/glassfish/domains/domain1/config/default-web.xml :' && \
	diff \
	 /opt/payara/appserver/glassfish/domains/domain1/config/default-web.xml.bak \
	 /opt/payara/appserver/glassfish/domains/domain1/config/default-web.xml || true && \
	\
	echo "POSTBOOT_COMMANDS=${POSTBOOT_COMMANDS}" && \
	touch ${POSTBOOT_COMMANDS} && \
        echo "set-log-attributes com.sun.enterprise.server.logging.GFFileHandler.rotationOnDateChange=true"     >> ${POSTBOOT_COMMANDS} && \
        echo "set-log-attributes com.sun.enterprise.server.logging.GFFileHandler.logtoFile=true"                >> ${POSTBOOT_COMMANDS} && \
        echo "set-log-attributes com.sun.enterprise.server.logging.GFFileHandler.maxHistoryFiles=100"           >> ${POSTBOOT_COMMANDS} && \
        echo "set-log-attributes fish.payara.enterprise.server.logging.PayaraNotificationFileHandler.rotationOnDateChange=true" >> ${POSTBOOT_COMMANDS} && \
        echo "set-log-attributes fish.payara.enterprise.server.logging.PayaraNotificationFileHandler.logtoFile=true"            >> ${POSTBOOT_COMMANDS} && \
        echo "set-log-attributes fish.payara.enterprise.server.logging.PayaraNotificationFileHandler.maxHistoryFiles=100"       >> ${POSTBOOT_COMMANDS} && \
        echo "list-applications"  >> ${POSTBOOT_COMMANDS} && \
        \            
        echo "echo +++ ${POSTBOOT_COMMANDS} :"  && \
        \            
        cat ${POSTBOOT_COMMANDS}
	

