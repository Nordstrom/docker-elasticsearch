FROM docker.elastic.co/elasticsearch/elasticsearch:6.1.1

ARG PROXY_HOST
ARG PROXY_PORT

RUN export ES_JAVA_OPTS="-Dhttps.proxyHost=$PROXY_HOST -Dhttps.proxyPort=$PROXY_PORT" \
 && bin/elasticsearch-plugin install discovery-ec2 \
 && bin/elasticsearch-plugin install repository-s3

ADD elasticsearch.in.sh ./config/
RUN sed -i 's/^-Xms/#-Xms/' ./config/jvm.options \
 && sed -i 's/^-Xmx/#-Xmx/' ./config/jvm.options \
 && sed -i 's/^/#/' ./config/x-pack/log4j2.properties \
 && echo ". \$ES_HOME/config/elasticsearch.in.sh" >> ./bin/elasticsearch-env
