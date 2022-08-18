#!/bin/bash

# -e stop on errors
# -u nameerror on undefined variables
# -o pipefail pipes catch errors
set -euo pipefail

if [ "$ENV" = "dev" ]; then
  echo "Running Development Server"
  exec python "identidock.py"
elif [ "$ENV" = "prod" ]; then
  echo "Running Production Server"
  exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/identidock.py \
       --callable app --stats 0.0.0.0:9191
fi