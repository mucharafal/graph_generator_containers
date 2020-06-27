from neo4j

#update and install git
run apt-get update -y
run apt-get install git -y
run apt-get install vim -y
run mkdir -p /usr/share/man/man1
run apt-get install maven -y

# create folders where external folder will be mounted
run mkdir -p /mnt/graph/input
run mkdir /mnt/graph/output

# clone repo for conversion
run mkdir -p /opt/converter /opt/driver
run chown neo4j:neo4j -R /opt/converter /opt/driver /opt
user neo4j
run cd /opt/driver && git clone https://github.com/ldbc/ldbc_snb_driver && cd ldbc_snb_driver && mvn install -DskipTests
run cd /opt/converter && git clone https://github.com/PlatformLab/ldbc-snb-impls && cd ldbc-snb-impls && wget https://bintray.com/repo/downloadMavenRepoSettingsFile/downloadSettings?repoPath=%2Fldbc%2Fsnb -O settings.xml && mvn install --projects snb-interactive-core --projects snb-interactive-neo4j -am -s settings.xml
workdir /opt/converter/ldbc-snb-impls/snb-interactive-neo4j