podman build -t child . --format=docker
podman tag localhost/child quay.io/vikacjadhav/child
podman push quay.io/vikacjadhav/child
oc delete all -l app=child
oc new-app --name child quay.io/vikacjadhav/child
oc delete route child
oc expose svc child
sleep 10
curl child-build.apps.ocp4.example.com 
