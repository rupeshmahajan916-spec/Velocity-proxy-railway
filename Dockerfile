FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
RUN apk add --no-cache curl jq
RUN LATEST_BUILD=$(curl -s https://api.papermc.io/v2/projects/velocity/versions/3.3.0-SNAPSHOT | jq -r '.builds[-1]') && \
    curl -o velocity.jar -L "https://api.papermc.io/v2/projects/velocity/versions/3.3.0-SNAPSHOT/builds/${LATEST_BUILD}/downloads/velocity-3.3.0-SNAPSHOT-${LATEST_BUILD}.jar"
COPY . .
EXPOSE 25565
CMD ["java", "-Xms512M", "-Xmx512M", "-XX:+UseG1GC", "-jar", "velocity.jar"]
