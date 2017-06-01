FROM redspark/oracle-jdk:1.8
MAINTAINER redspark <infra@redspark.io>

ADD target/redspark-initializr-service.jar /opt/redspark-initializr-service.jar


EXPOSE 8080

CMD java -Xms256M -Xmx512M -Duser.timezone=America/Sao_Paulo -jar /opt/redspark-initializr-service.jar
