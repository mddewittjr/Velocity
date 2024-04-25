FROM papermc/base

EXPOSE 25577/tcp 25577/udp

ADD https://api.papermc.io/v2/projects/velocity/versions/3.3.0-SNAPSHOT/builds/384/downloads/velocity-3.3.0-SNAPSHOT-384.jar /server.jar

WORKDIR /data
VOLUME /data

ENTRYPOINT ["java", "-Xms1G", "-Xmx1G", "-XX:+UseG1GC", "-XX:G1HeapRegionSize=4M", "-XX:+UnlockExperimentalVMOptions", "-XX:+ParallelRefProcEnabled", "-XX:+AlwaysPreTouch", "-XX:MaxInlineLevel=15", "-jar", "/server.jar"]