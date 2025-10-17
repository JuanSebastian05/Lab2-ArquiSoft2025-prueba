FROM openjdk:11
EXPOSE 8080
ADD target/lab2Prueba.jar lab2Prueba.jar
ENTRYPOINT ["java","-jar","/lab2Prueba.jar"]