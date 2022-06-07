#!/bin/bash

set -e

GHOST="grafana"
GPORT="3000"
GUSER='admin'
#GPASS='pass'
GPASS='admin'


cmd="$@"
# подготовленный файл с дашбордом
DASHBOARD='/dash.json'

curl -V

>&2 echo "--- Check $GHOST for available ---"

until curl http://"$GHOST":"$GPORT"; do
  >&2 echo "$GHOST is unavailable - sleeping"
  sleep 1
done

>&2 echo "$GHOST is up - executing command"


# datasource
curl -H "Content-Type: application/json" -X POST -i http://$GUSER:$GPASS@$GHOST:$GPORT/api/datasources -d '{"name":"prometheus","type":"prometheus","url":"http://prometheus:9090","access":"proxy","basicAuth":false,"is_default":true}'
# dashboard
curl -H "Content-Type: application/json" -X POST -i http://$GUSER:$GPASS@$GHOST:$GPORT/api/dashboards/db --data-binary @$DASHBOARD

exec $cmd