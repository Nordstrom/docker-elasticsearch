FROM docker.elastic.co/kibana/kibana:6.2.4

RUN bin/kibana-plugin \
  install https://github.com/Nordstrom/patternizer/releases/download/v0.20/patternizer-6.2.4.zip

ADD default_watch.json /opt/kibana/plugins/x-pack/plugins/watcher/public/models/watch
