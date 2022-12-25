podman stop build
podman rm build
echo " cleanup complete and runnign new container"
printf "\n"
podman run -d --name build localhost/build:latest  
