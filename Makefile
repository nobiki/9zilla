Dockerfile: Dockerfile.in ./include/*.docker
	cpp -P -o Dockerfile Dockerfile.in

build: Dockerfile
	sudo docker build --no-cache -t RepositoryName .
