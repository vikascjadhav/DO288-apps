
Part 1 - Running parent image without and with scc context
#Run below command without setting security context
$oc new-app --name build-parent --strategy=docker  https://github.com/vikascjadhav/DO288-apps --context-dir exam-EX288-practice/build-child-image-practice/httpd-parent
 this will fail and pod will be in error state

now add user to scc by using admin role user run below command

$oc adm policy add-scc-to-user anyuid 1001

but still there is problem and below is error.

 AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 10.8.0.73. Set the 'ServerName' directive globally to suppress this message
 (13)Permission denied: AH00072: make_sock: could not bind to address [::]:80
 (13)Permission denied: AH00072: make_sock: could not bind to address 0.0.0.0:80

Part2 Fix parent image in Docker file with port and permission

RUN IMAGE
using fixed dockerfile

$oc new-app --name build-parent --strategy=docker  https://github.com/vikascjadhav/DO288-apps --context-dir exam-EX288-practice/build-child-image-practice/httpd-parent-fixed



Part 3 create child image from parent image and run it 

 push parent -image in repository like qauyio
 create secret link secret with project in openshift and run s2i build with github location of child dockerfile


