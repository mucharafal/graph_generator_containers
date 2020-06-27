docker run \
    --mount type=bind,source="`pwd`/input_folder",target="/mnt/graph/input" \
    --mount type=bind,source="`pwd`/output_folder",target="/mnt/graph/output" \
    -it converter:v0.1 /bin/bash -c 'cd /opt/converter/ldbc-snb-impls/snb-interactive-neo4j
    mvn exec:java -Dexec.mainClass="net.ellitron.ldbcsnbimpls.interactive.neo4j.util.DataFormatConverter" -Dexec.args="/mnt/graph/input/social_network/dynamic/ /mnt/graph/output" -s ./../settings.xml
    mvn exec:java -Dexec.mainClass="net.ellitron.ldbcsnbimpls.interactive.neo4j.util.DataFormatConverter" -Dexec.args="/mnt/graph/input/social_network/static/ /mnt/graph/output" -s ./../settings.xml'