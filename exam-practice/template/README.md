

FIX Template by below details:

1) check name of images stream where template need to be create this should be name of project by default it might have been set to "openshift" namespace
2) check if imagestream exists you can use $oc get is -n openshift
---------------
RUN fixed template

oc create -f 2fixed.yaml
new-app --name hello --template=quotes
oc cp  quote.sql quotesdb-1-srndv:/tmp/

login to pod of db and load files
  oc rsh -t  quotesdb-1-srndv

 mysql -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /tmp/quote.sql

come out of shell and run curl to see random quotes:
 curl  quotesapi-indy.apps.ocp4.example.com/get.php

3) Optional set data in db

4) Tyr custom param



	
