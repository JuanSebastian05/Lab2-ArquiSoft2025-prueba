[![CI/CD Pipeline](https://github.com/JuanSebastian05/Lab2-ArquiSoft2025-prueba/actions/workflows/build.yml/badge.svg)](https://github.com/JuanSebastian05/Lab2-ArquiSoft2025-prueba/actions/workflows/build.yml)

# Lab2\-ArquiSoft2025\-prueba

Aplicación Spring Boot que expone endpoints REST para verificar estado, versión y generar datos de ejemplo de naciones, monedas y aviación usando JavaFaker.

## Requisitos

- JDK 11
- Maven 3\.8\+
- IntelliJ IDEA 2025\.2 \(opcional\)

## Estructura del proyecto

- Código fuente: `Lab2-ArquiSoft2025-prueba/src/main/java/com/udea/lab2/`
    - `Lab2Application.java`: clase principal Spring Boot
    - `DataController.java`: controlador REST con los endpoints
- Build: `Lab2-ArquiSoft2025-prueba/pom.xml`
- CI: `Lab2-ArquiSoft2025-prueba/.github/workflows/build.yml`
- Documentación: `Lab2-ArquiSoft2025-prueba/README.md`

## Configuración y ejecución

- Compilar y ejecutar pruebas:

        mvn -B clean test

- Ejecutar la aplicación:

        mvn spring-boot:run

- Empaquetar y ejecutar el JAR:

        mvn -B clean package
        java -jar target/lab2-0.0.1-SNAPSHOT.jar

Aplicación disponible en: http://localhost:8080

## Endpoints

- GET `/`  
  Salud del servicio. Respuesta: `HEALTH CHECK OK`

- GET `/version`  
  Versión del servicio. Respuesta: `VERSION IS 1.0.0`

- GET `/nations`  
  Lista \[10] de naciones aleatorias. Campos: `nationality`, `capitalCity`, `bandera`, `language`

- GET `/currencies`  
  Lista \[20] de monedas aleatorias. Campos: `name`, `code`

- GET `/aviation`  
  Lista \[20] de datos de aviación. Campos: `aircraft`, `airport`, `METAR`

## Ejemplos de uso con cURL

- Estado:

        curl http://localhost:8080/

- Versión:

        curl http://localhost:8080/version

- Naciones:

        curl http://localhost:8080/nations

- Monedas:

        curl http://localhost:8080/currencies

- Aviación:

        curl http://localhost:8080/aviation

## Ejemplo de respuesta \(GET `/nations`\)

    [
      {
        "nationality": "German",
        "capitalCity": "Berlin",
        "bandera": "🇩🇪",
        "language": "German"
      }
    ]

## CI/CD \(GitHub Actions\)

Workflow `Lab2-ArquiSoft2025-prueba/.github/workflows/build.yml`:
- Disparadores: `workflow_dispatch` y `push` a `main`
- Entorno: `ubuntu-latest`
- JDK 11 \(Temurin\)
- Caché de Maven
- Ejecuta `mvn -B test`

YAML de referencia:

    name: CI/CD Pipeline
    on:
      workflow_dispatch:
      push:
        branches:
          - main

    jobs:
      tests:
        name: Unit Tests
        runs-on: ubuntu-latest
        steps:
          - name: Checkout
            uses: actions/checkout@v4

          - name: Set up JDK
            uses: actions/setup-java@v4
            with:
              distribution: temurin
              java-version: '11'

          - name: Cache Maven repository
            uses: actions/cache@v3
            with:
              path: ~/.m2/repository
              key: ${{ runner.os }}-m2-${{ hashFiles('**/pom.xml') }}
              restore-keys: |
                ${{ runner.os }}-m2-

          - name: Run tests
            run: mvn -B test

## Dependencias clave

- spring\-boot\-starter\-web
- spring\-boot\-starter\-test \(scope: test\)
- com\.github\.javafaker:javafaker:1\.0\.2

## Desarrollo en IntelliJ IDEA

- Abrir el directorio del proyecto como proyecto Maven.
- Ejecutar la clase `Lab2Application` \(Run ▶\) o usar `mvn spring-boot:run`.

## Licencia

Uso académico/demostración.
