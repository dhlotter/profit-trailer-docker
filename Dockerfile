FROM openjdk:8-alpine

WORKDIR /app

# Install unzip if not already available
RUN apk add --no-cache unzip

# Download and unzip the ProfitTrailer package
ADD https://download.profittrailer.com/ProfitTrailer.zip /app
RUN unzip -jqd /app /app/ProfitTrailer.zip && rm /app/ProfitTrailer.zip

# Declare volumes for persistent data and logs
VOLUME [ "/app/data", "/app/logs" ]

# Expose port for the application
EXPOSE 8081

# Set the default command to run the application
CMD [ "java", "-Djava.net.preferIPv4Stack=true", "-Dsun.stdout.encoding=UTF-8", "-Dio.netty.allocator.numDirectArenas=0", "-Djdk.nio.maxCachedBufferSize=262144", "-XX:+UseSerialGC", "-XX:+UseStringDeduplication", "-Xms64m", "-Xmx512m", "-XX:CompressedClassSpaceSize=300m", "-XX:MaxMetaspaceSize=128m", "-jar", "/app/ProfitTrailer.jar" ]
