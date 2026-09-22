FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
RUN apk add --no-cache wget
RUN wget -O velocity.jar "https://api.papermc.io/v2/projects/velocity/versions/3.4.0-SNAPSHOT/builds/450/downloads/velocity-3.4.0-SNAPSHOT-450.jar" || \
    wget -O velocity.jar "https://fill-data.papermc.io/v2/projects/velocity/versions/3.3.0/builds/latest/downloads/velocity-latest.jar" || \
    wget -O velocity.jar "https://download.geysermc.org/v2/projects/velocity/versions/latest/builds/latest/downloads/velocity"
COPY . .
EXPOSE 25565
CMD ["java", "-Xms512M", "-Xmx512M", "-XX:+UseG1GC", "-jar", "velocity.jar"]
