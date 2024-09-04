# This makefile has the objective of providing sample commands
# for the tasks you might need to run

# Default target, no operation
help:
	echo "compose-dx tool"

# Pull images frm remote registry
pull:
	docker pull ${DX_DOCKER_IMAGE_CORE}
	docker pull ${DX_DOCKER_IMAGE_RINGAPI}
	docker pull ${DX_DOCKER_IMAGE_HAPROXY}
	docker pull ${DX_DOCKER_IMAGE_PREREQS_CHECKER}

# Prepare target - Creates volume folder - not useful after CF218
# prepare:
# 	mkdir -p ./volumes/core/wp_profile
# 	-chown -R 1000:1001 ./volumes
# 	chmod ug+rwx ./volumes/core/wp_profile

# Up target startup the composition and daeominze
up:
	docker-compose up -d

run:
	docker run -d \
	--platform linux/amd64 \
	--name dx-run-core \
	-v ./volumes/core/wp_profile:/opt/HCL/wp_profile \
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
	