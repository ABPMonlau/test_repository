# --- Etapa 1: Compilación con Maven 3 y Java 21 (LTS) ---
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app

# Copiar el pom.xml y el código fuente
COPY pom.xml .
COPY src ./src

# Compilar el proyecto saltándose los tests
RUN mvn clean package -DskipTests

# --- Etapa 2: Imagen de ejecución ligera con Java 21 ---
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Copiar el .jar empaquetado desde la etapa de compilación
COPY --from=build /app/target/*.jar app.jar

# Exponer el puerto por defecto de Spring Boot
EXPOSE 8080

# Arrancar la API
ENTRYPOINT ["java", "-jar", "app.jar"]