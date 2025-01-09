# # Step 1: Use a base image that has OpenJDK 17 (or any version you need)
# FROM openjdk:17-jdk-slim as build

# # Step 2: Set the working directory in the container
# WORKDIR /app

# # Step 3: Copy the Spring Boot JAR file into the container 
# COPY target/demo-0.0.1-SNAPSHOT.jar app.jar

# # Step 4: Expose the port the app runs on
# EXPOSE 8080

# # Step 5: Command to run the Spring Boot app
# ENTRYPOINT ["java", "-jar", "/app/app.jar"]


FROM openjdk:17-jdk-slim as build

ENV VERTICLE_HOME /work/application
ENV VERTICLE_FILE /target/demo-0.0.1-SNAPSHOT.jar

ENV FILE demo-0.0.1-SNAPSHOT.jar

EXPOSE 8080

WORKDIR ${VERTICLE_HOME}
COPY ${VERTICLE_FILE} ${VERTICLE_HOME}

ENTRYPOINT [ "sh", "-c" ]
CMD ["exec java  -Xms512m -Xmx2g  -jar $FILE"]

#  docker build -f Dockerfile -t kyosk/interview-demo:latest .

# docker run -d --name kyosk_interview --restart unless-stopped -p 8080:8080  kyosk/interview-demo:latest