@echo off
java --add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.lang=ALL-UNNAMED -jar target/Chap9-1.0-SNAPSHOT.war
