FROM  hub.c.163.com/public/tomcat:7.0.28
MAINTAINER netease
RUN apt-get update && apt-get install -y maven openjdk-7-jdk
COPY . ~/java
WORKDIR ~/java
RUN mvn package && cp -rf ~/java/target/robot-dt2/* /var/lib/tomcat7/webapps/ROOT/
ENTRYPOINT /etc/init.d/tomcat7 start
