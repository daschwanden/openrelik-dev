#!/bin/bash
if [ $# -lt 1 ]; then
  echo "usage: newWorker.sh <worker>"  
  exit 1
fi
WORKER=$1

git clone https://github.com/openrelik/openrelik-worker-template.git
mv openrelik-worker-template openrelik-worker-${WORKER}

sed "s/openrelik-worker-template/openrelik-worker-${WORKER}/g" develop-watch.yml > develop-watch.sed
cd openrelik-worker-${WORKER}/src
sed "s/your-worker-package-name.tasks.your_task_name/openrelik-worker-${WORKER}.tasks.${WORKER}/" tasks.py > tasks.py2
sed 's#<REPLACE_WITH_COMMAND>#/usr/bin/ls#g' tasks.py2 > tasks.py
rm tasks.py2
cd -

cp openrelik/docker-compose.yml openrelik/docker-compose.yml.orig
cat develop-watch.sed >> openrelik/docker-compose.yml
rm develop-watch.sed
