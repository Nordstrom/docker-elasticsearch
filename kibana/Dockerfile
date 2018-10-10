FROM docker.elastic.co/kibana/kibana:6.4.2

RUN bin/kibana-plugin \
  install https://github.com/Nordstrom/patternizer/releases/download/v0.22/patternizer-6.4.2.zip

ADD default_watch.json /opt/kibana/plugins/x-pack/plugins/watcher/public/models/watch
