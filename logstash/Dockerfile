FROM logstash:5.3

# can't build via proxy :(
# - https://github.com/elastic/logstash/issues/6619
# - https://github.com/elastic/logstash/issues/6753
#ARG PROXY_HOST
#ARG PROXY_PORT
#RUN export JRUBY_OPTS="-J-Dhttp.proxyHost=$PROXY_HOST -J-Dhttp.proxyPort=$PROXY_PORT" \
# && logstash-plugin install logstash-output-influxdb \
# && rm -rf /root/.m2

RUN logstash-plugin install logstash-output-influxdb \
 && rm -rf /root/.m2
