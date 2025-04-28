# Use an OpenJDK image
FROM openjdk:21-jdk-slim

# Set working directory inside container
WORKDIR /app

# Copy pom.xml and src folder
COPY pom.xml .
COPY src ./src

# Install Maven (Optional, if you prefer) and build JAR
RUN apt-get update && apt-get install -y maven
RUN mvn clean install

# Copy the generated jar
COPY target/frontend-service-0.0.1-SNAPSHOT.jar app.jar

# Expose port (Render assigns dynamically or we use 3000 if fixed)
EXPOSE 3000

# Run the jar
ENTRYPOINT ["java", "-jar", "app.jar"]
