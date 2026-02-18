FROM maven:3.9-eclipse-temurin-21

WORKDIR /app

# Cache des dépendances
COPY pom.xml .
RUN mvn -q -DskipTests dependency:go-offline

# Code source
COPY src ./src

EXPOSE 8080
CMD ["mvn", "spring-boot:run"]
