#!/bin/bash

mbytes=$(free -m | awk '/^Mem:/{print $2}')
max_mbytes=$(( 31 * 1024 ))
heap_mbytes=$(( $mbytes / 2 ))
heap_mbytes=$(( $heap_mbytes > $max_mbytes ? $max_mbytes : $heap_mbytes ))

ES_CLASSPATH="$ES_HOME/lib/*"
ES_JAVA_OPTS="-Xmx${heap_mbytes}m -Xms${heap_mbytes}m $ES_JAVA_OPTS"
