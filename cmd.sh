#!/bin/bash
#
set -e

if [ "$ENV" = 'DEV' ] ; then
  echo -e "Running Development Server ⌨️🎧🚧 "
  exec python "identidock.py"
elif [ "$ENV" = 'UNIT' ] ; then
  echo "Running Unit Tests 👷"
  exec python "tests.py"
else
  echo -e "Running Production Server 🏁"
  exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/identidock.py \
                 --callable app --stats 0.0.0.0:9191
fi






