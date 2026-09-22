# Spring Boot Demo

Starter application using Java 25, Spring Boot, Spring Web,
Thymeleaf, Spring Data JPA, and H2.

## Requirements

- JDK 25, with JAVA_HOME pointing to its installation directory.
- Internet access for the initial Maven and dependency downloads.

Maven is provided through the included Maven Wrapper.
No separate database installation is required.

Run the commands below from the project root, where pom.xml is located.
These commands are for Windows PowerShell.

## Run from source

```powershell
.\mvnw.cmd spring-boot:run
```

## Build and test

```powershell
.\mvnw.cmd clean verify
```

## Run the packaged application

After building:

```powershell
java -jar .\target\demo-0.0.1-SNAPSHOT.jar
```

The server listens at http://localhost:8080.
Stop it with Ctrl+C.

## Current state

This is the initial project setup. No pages or endpoints have been
implemented, so opening the root URL currently returns HTTP 404.

H2 runs in memory. Database contents are not retained after the
application stops.