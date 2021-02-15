#!/bin/bash
minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metallb
kubectl apply -f ./srcs/metallb.yaml
kubectl apply -f ./srcs/volumes.yaml

#nginx
docker build -t nginx_image ./srcs/nginx
kubectl apply -f ./srcs/nginx.yaml

#wordpress
docker build -t wordpress_image ./srcs/wordpress
kubectl apply -f ./srcs/wordpress.yaml

#phpmyadmin
docker build -t phpmyadmin_image ./srcs/phpmyadmin
kubectl apply -f ./srcs/phpmyadmin.yaml

#mysql
docker build -t mysql_image ./srcs/mysql
kubectl apply -f ./srcs/mysql.yaml

#ftps
docker build -t ftps_image ./srcs/ftps
kubectl apply -f ./srcs/ftps.yaml

#grafana
docker build -t grafana_image ./srcs/grafana
kubectl apply -f ./srcs/grafana.yaml

#influxdb
docker build -t influxdb_image ./srcs/influxdb
kubectl apply -f ./srcs/influxdb.yaml


