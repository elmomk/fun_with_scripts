#!/bin/bash

# use local env
# export AWS_ACCESS_KEY_ID=
# export AWS_SECRET_ACCESS_KEY=

ENVNAME=$1
DATE=$(date +%Y%m%d%H%M%N)

mydmenv () {
if [ $(docker-machine ls | grep amazonec2 | awk '{print $1}') == ${ENVNAME} ]; then
	echo "env is set up proceeding into env"
	eval $(docker-machine env ${ENVNAME})
	docker info
	docker-compose up -d
else
	echo "env isn't set up, setting up right now"
	docker-machine -D create --driver=amazonec2 --amazonec2-region=ap-northeast-1 ${ENVNAME}
	mydmenv
fi
}

buildimage () {
	docker build -f laravel.app.dockerfile -t kibage/kibage-backend .
	docker tag kibage/kibage-backend:$DATE 785708698396.dkr.ecr.ap-northeast-1.amazonaws.com/kibage/kibage-backend:$DATE
       	docker push 785708698396.dkr.ecr.ap-northeast-1.amazonaws.com/kibage/kibage-backend:$DATE
	docker build -f laravel.app.dockerfile -t kibage/kibage-backend .
	docker tag kibage/kibage-frontend:$DATE 785708698396.dkr.ecr.ap-northeast-1.amazonaws.com/kibage/kibage-frontend:$DATE
	docker push 785708698396.dkr.ecr.ap-northeast-1.amazonaws.com/kibage/kibage-frontend:$DATE

}


buildimage
mydmenv
