# Helpers for project setup and docker-compose management (start/stop/logs...)

# Default target, no operation
help:
	echo "compose-dx tool"

# Intsall nodejs version of dxclient
install-nodejs-dx-client:
	npm install -g @hcl-software/dxclient

# Create cert for localhsot and add to trust store, tested on osx only
create-self-signed-localhost-cert:
	mkdir -p certs && cd certs && \
	  openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 \
	  -subj '/CN=localhost' -keyout localhost.crt.key -out localhost.crt && \
	sudo security add-trusted-cert -p ssl -d -r trustRoot \
	  -k ~/Library/Keychains/login.keychain localhost.crt

# Install tolls to work with
tooling:
	brew install just
	brew install direnv
	open https://direnv.net/docs/hook.html

# Pull images frm remote registry
pull:
	docker pull ${DX_DOCKER_IMAGE_CORE}
	docker pull ${DX_DOCKER_IMAGE_RINGAPI}
	docker pull ${DX_DOCKER_IMAGE_HAPROXY}
	docker pull ${DX_DOCKER_IMAGE_DXCLIENT}

# Start docker images as configured for compose and push in background
up:
	docker-compose up -d --remove-orphans

# Starts Config Wizard profile on dx-core
start-cw-profile:
	docker exec dx-core /opt/HCL/AppServer/profiles/cw_profile/bin/startServer.sh server1

# Downloads jrebel into container persisted volume
prepare-jrebel:
	@curl -O https://dl.zeroturnaround.com/jrebel-stable-nosetup.zip
	unzip jrebel-stable-nosetup.zip
	mv ./jrebel "${DX_PROFILE_ROOT}"
	@rm jrebel-stable-nosetup.zip
	@echo
	@echo "1. Add the following to java process definition of desired server:"
	@echo "    -Xshareclasses:none -agentpath:/opt/HCL/wp_profile/jrebel/lib/libjrebel64.so -Drebel.remoting_plugin=true"
	@echo
	@echo "2. make restart'"

# Runs standalone dx-core image
run:
	docker run -d \
	--platform linux/amd64 \
	--name dx-run-core \
	-v ${DX_PROFILE_ROOT}:/opt/HCL/wp_profile \
	-p 10039:10039 \
	-p 10041:10041 \
	-p 10042:10042 \
	-p 10200:10200 \
	-p 10202:10202 \
	-p 10203:10203 \
	-p 10033:10033 \
	${DX_DOCKER_IMAGE_CORE}

prepare:
	mkdir -p ${DX_PROFILE_ROOT}
	chown -R 1000:10001 ${DX_PROFILE_ROOT}
	chmod a+rwx ${DX_PROFILE_ROOT}
	echo "Prepared: ${DX_PROFILE_ROOT}"
	mkdir -p ${DX_DAM_ROOT}/upload
	chown -R 1000:10001 ${DX_DAM_ROOT}/upload
	chmod a+rwx ${DX_DAM_ROOT}/upload
	echo "Prepared: ${DX_DAM_ROOT}/upload"
	mkdir -p ${DX_DAM_ROOT}/db 
	chown -R 1000:10001 ${DX_DAM_ROOT}/db 
	chmod a+rwx ${DX_DAM_ROOT}/db 
	echo "Prepared: ${DX_DAM_ROOT}/db"

# Logs target show logs from all containers
logs:
	docker-compose logs -f

# Down target, stops all containers
down:
	docker-compose down

restart:
	make down && make up
