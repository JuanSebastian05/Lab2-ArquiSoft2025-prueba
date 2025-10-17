FROM openjdk:11
EXPOSE 8080
ADD target/lab2prueba.jar lab2prueba.jar
ENTRYPOINT ["java","-jar","/lab2Prueba.jar"]