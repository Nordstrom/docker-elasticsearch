#!/bin/bash

mem_bytes=$(free -b | awk '/^Mem:/{print $2}')
max_mbytes=$(( 31 * 1024 ))
heap_mbytes=$(( $mem_bytes / 2 / 1024 / 1024 ))
heap_mbytes=$(( $heap_mbytes > $max_mbytes ? $max_mbytes : $heap_mbytes ))

ES_CLASSPATH="$(ls $ES_HOME/lib/elasticsearch*):$ES_HOME/lib/*"
ES_JAVA_OPTS="-Xmx${heap_mbytes}m -Xms${heap_mbytes}m $ES_JAVA_OPTS"
