#!/bin/bash -x

REPO_URL='https://github.com/victorfarruda/django-demo'
RUNNER_NAME='django-demo'
RUNNER_TOKEN='AEL5QIIKREVSONYBZHIU7NK67O72S'

./config.sh \
	--url "${REPO_URL}" \
     	--token "${RUNNER_TOKEN}" \
    	--name "${RUNNER_NAME}" 

