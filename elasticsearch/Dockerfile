FROM docker.elastic.co/elasticsearch/elasticsearch:5.2.2

ARG PROXY_HOST
ARG PROXY_PORT
RUN export ES_JAVA_OPTS="-Dhttps.proxyHost=$PROXY_HOST -Dhttps.proxyPort=$PROXY_PORT" \
 && bin/elasticsearch-plugin install discovery-ec2 \
 && bin/elasticsearch-plugin install repository-s3
