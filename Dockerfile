# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-alpine

# Set the working directory
WORKDIR /app

# Copy the jar file from the target directory to the container
COPY target/azuredemo-0.0.1-SNAPSHOT.jar /app/azuredemo.jar

# Expose the port the application runs on
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "/app/azuredemo.jar"]