
part1 build Directoy

 please note that here order of commands matter else httpd container wont start 

 1) delete and cretae /run/httpd/
 2) apply sed -i on /etc/httpd/conf/httpd.conf to update port 80 and Servername directive
 3) apply chgrp and chmod /var/run/httpd and /var/run/logs 

part 2: with scc

 1) oc adm policy add-scc-to-user anyuid -z 1001
 2) even though we added scc to user still apache wont run on port 80 so changed port to 8080 similar to point numner #1 using sed commands


part 3) build chaild image from this parent image for testing and run it and see if it workks to override content of index.html


