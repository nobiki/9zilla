Dockerfile: Dockerfile.in ./include/*.docker
	cpp -P -o Dockerfile Dockerfile.in

update:
	git pull origin master
	git submodule update --init --recursive
	git submodule foreach git pull origin master
	cp -i ./24ecf417fe4292edf01698b5f3642edd/9zilla-docker-compose.yml ./docker-compose.yml

build: Dockerfile
	docker build --no-cache -t 9zilla:latest .

up:
	docker-compose up -d

down:
	docker-compose down

rmi-none:
	docker images | awk '/<none/{print $3}' | xargs docker rmi

rmi-9zilla:
	docker images | awk '/9zilla/{print $3}' | xargs docker rmi
