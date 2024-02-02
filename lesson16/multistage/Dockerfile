FROM openjdk:11-jdk AS build
COPY test.java .
RUN javac test.java
 
FROM openjdk:11-jre AS run
EXPOSE 8089
COPY --from=build Hello.class .
CMD java Hello