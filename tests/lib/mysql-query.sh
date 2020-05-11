#!/bin/bash
kubectl run mysql-client --image=mysql:5.7 -it --rm --restart=Never \
      -- mysql -h mysql-cluster-mysql -u root -ppassword -e "show databases; show slave status;"