# First stage: build the application with Gradle
FROM gradle:7-jdk-jammy AS builder

# Copy the build.gradle, 'settings.gradle' files and the 'src' and 'config' folders to the temporary image
WORKDIR /usr/src/click-service-project-api
COPY . .

# Build the Spring Boot application and generate the JAR file
RUN gradle clean bootJar

# Second stage: create the final image
FROM openjdk:21-ea-17-jdk AS server

WORKDIR /usr/src/click-service-project-api

# Set the environment variables for PostgreSQL settings
ENV POSTGRES_HOST=host.docker.internal
ENV POSTGRES_PORT=5432
ENV POSTGRES_DB=click-service-project
ENV POSTGRES_USERNAME=PIh4Yrv75BLP1SuXY9XU
ENV POSTGRES_PASSWORD=PIh4Yrv75BLP1SuXY9XU

# Expose the application port for external access
EXPOSE 8080

# Copy the JAR generated in the first stage to the final image
COPY --from=builder "/usr/src/click-service-project-api/build/libs/*.jar" ./click-service-project-api.jar

# Start the application with the specified Java command
# The '-Dspring.profiles.active=local' argument sets the active profile to 'local'
CMD ["java", "-Dspring.profiles.active=docker-local", "-jar", "./click-service-project-api.jar"]
