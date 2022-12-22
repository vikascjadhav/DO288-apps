
part1 build Directoy

 please note that here order of commands matter else httpd container wont start 

 1) delete and cretae /run/httpd/
 2) apply sed -i on /etc/httpd/conf/httpd.conf to update port 80 and Servername directive
 3) apply chgrp and chmod /var/run/httpd and /var/run/logs 

