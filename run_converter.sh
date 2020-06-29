mkdir output/merged -p
chmod +777 output/merged
docker run \
    --mount type=bind,source="`pwd`/input",target="/mnt/graph/input" \
    --mount type=bind,source="`pwd`/output",target="/mnt/graph/output" \
    -it converter:v0.1 /bin/bash -c 'cd /opt/converter/ldbc-snb-impls/snb-interactive-neo4j
    git pull
    mvn install -s ./../settings.xml
    mvn exec:java -Dexec.mainClass="net.ellitron.ldbcsnbimpls.interactive.neo4j.util.DataFormatConverter" -Dexec.args="/mnt/graph/input/social_network/merged/ /mnt/graph/output/merged" -s ./../settings.xml
    chmod +777 /mnt/graph/output/merged/* '