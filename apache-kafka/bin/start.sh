#!/bin/sh

DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

docker-compose -f $DIR/../docker-compose.yaml up -d

status=$?
if [ $status -eq 0 ]; then
   echo "Successfully started.."
else
   echo "Status code: $status"
fi

exit $status
