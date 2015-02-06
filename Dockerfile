FROM enschede/linux-core-jdk7

ADD apache-tomcat-8.0.18.zip /opt/apache-tomcat-8.0.18.zip

RUN cd /opt && \
    unzip apache-tomcat-8.0.18.zip && \
    rm apache-tomcat-8.0.18.zip && \
    chmod a+x apache-tomcat-8.0.18/bin/*.sh

EXPOSE 8080 7402

#CMD /bin/bash
CMD java \
    -Djava.util.logging.config.file=/opt/apache-tomcat-8.0.18/conf/logging.properties \
    -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager \
    -Djava.endorsed.dirs=/opt/apache-tomcat-8.0.18/endorsed \
    -classpath /opt/apache-tomcat-8.0.18/bin/bootstrap.jar:/opt/apache-tomcat-8.0.18/bin/tomcat-juli.jar \
    -Dcatalina.base=/opt/apache-tomcat-8.0.18 \
    -Dcatalina.home=/opt/apache-tomcat-8.0.18 \
    -Djava.io.tmpdir=/opt/apache-tomcat-8.0.18/temp \
    -Djolokia.port=7402 \
    org.apache.catalina.startup.Bootstrap start
