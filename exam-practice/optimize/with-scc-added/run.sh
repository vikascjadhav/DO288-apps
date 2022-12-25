podman stop build
podman rm build
echo " cleanup complete and runnign new container"
printf "\n"
#podman run -d --name build localhost/build:latest 
podman build -t build . --format=docker
podman tag localhost/build quay.io/vikacjadhav/build
podman push quay.io/vikacjadhav/build
oc delete all -l app=build
oc new-app --name build quay.io/vikacjadhav/build 
oc delete route build
oc expose svc build
sleep 10
curl build-build.apps.ocp4.example.com 
