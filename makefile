# This makefile has the objective of providing sample commands
# for the tasks you might need to run

# Default target, no operation
help:
	echo "compose-dx tool"

# Pull images frm remote registry
pull:
	. ./setEnv.sh
	docker pull ${DX_DOCKER_IMAGE_CORE}
	docker pull ${DX_DOCKER_IMAGE_RINGAPI}
	docker pull ${DX_DOCKER_IMAGE_HAPROXY}
	docker pull ${DX_DOCKER_IMAGE_PREREQS_CHECKER}

# Up target startup the composition and daeominze
up:
	. ./setEnv.sh
	docker-compose up -d

run:
	. ./setEnv.sh
	docker run -d \
	--platform linux/amd64 \
	--name dx-run-core \
	-v ./volumes/${DX_VERSION}/core/wp_profile:/opt/HCL/wp_profile \
	-p 10039:10039 \
	-p 10041:10041 \
	${DX_DOCKER_IMAGE_CORE}

# Logs target show logs from all containers
logs:
	docker-compose logs -f

# Down target, stops all containers
down:
	docker-compose down

# Clean target
clean:
	docker-compose down -v
	rm -rf ./volumes
	