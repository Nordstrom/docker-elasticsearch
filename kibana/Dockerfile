FROM docker.elastic.co/kibana/kibana:6.1.1

RUN bin/kibana-plugin \
  install https://github.com/Nordstrom/patternizer/releases/download/v0.12/patternizer-6.1.1.zip

ADD default_watch.json /opt/kibana/plugins/x-pack/plugins/watcher/public/models/watch
