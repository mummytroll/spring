FROM openjdk:18
COPY ./build /
WORKDIR /
EXPOSE 8081
RUN /mvnw clean package -U
CMD java -jar /target/demo_m.jar

