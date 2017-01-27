FROM elasticsearch:5.1

ARG PROXY_HOST
ARG PROXY_PORT

RUN export ES_JAVA_OPTS="-DproxyHost=$PROXY_HOST -DproxyPort=$PROXY_PORT" \
 && bin/elasticsearch-plugin install discovery-ec2 \
 && bin/elasticsearch-plugin install repository-s3
