FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
RUN apk add --no-cache curl
RUN curl -o velocity.jar https://api.papermc.io/v2/projects/velocity/versions/3.3.0-SNAPSHOT/builds/435/downloads/velocity-3.3.0-SNAPSHOT-435.jar
COPY . .
EXPOSE 25565
CMD ["java", "-Xms512M", "-Xmx512M", "-XX:+UseG1GC", "-jar", "velocity.jar"]
