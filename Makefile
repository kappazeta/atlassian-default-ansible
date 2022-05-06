NAME=atlassian-default-ansible
LOCAL_TAG=${NAME}:latest
REPOSITORY=sussch
VERSION=1
TARGET=${REPOSITORY}/${NAME}:${VERSION}

all: image

image: Dockerfile
	docker build . --tag ${LOCAL_TAG}

podman: Dockerfile
	# --tls-verify=false to force podman to use HTTP instead of HTTPS.
	docker build --tag ${LOCAL_TAG}

delete: stop
	docker rm --force ${NAME}

login:
	docker login --username sussch --password-stdin $(REPOSITORY)

push:
	docker tag $(LOCAL_TAG) $(TARGET)
	docker push $(TARGET)
