#!/bin/bash

set -e
MAX_TRIES=10


function dbIsReady() {
   docker logs my-mysql 2>&1 | grep "Starting MySQL"
}

function waitUntilServiceIsReady() {
   attempt=1
   while [ $attempt -le $MAX_TRIES ]; do
      if "$@"; then
         echo "$2 container is up!"
         break
      fi
      echo "Waiting for $2 container... (attempt: $((attempt++)))"
      sleep 2
   done

   if [ $attempt -gt $MAX_TRIES ]; then
      echo "Error: $2 not responding, cancelling set up"
      exit 1
   fi
}

waitUntilServiceIsReady dbIsReady "MySQL"
