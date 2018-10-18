FROM docker.elastic.co/elasticsearch/elasticsearch:6.4.2

RUN bin/elasticsearch-plugin install --batch discovery-ec2 \
 && bin/elasticsearch-plugin install --batch repository-s3

ADD elasticsearch.in.sh ./config/
RUN sed -i 's/^-Xms/#-Xms/' ./config/jvm.options \
 && sed -i 's/^-Xmx/#-Xmx/' ./config/jvm.options \
 && echo ". \$ES_HOME/config/elasticsearch.in.sh" >> ./bin/elasticsearch-env
