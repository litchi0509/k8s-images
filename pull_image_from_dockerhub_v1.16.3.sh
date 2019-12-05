#!/bin/bash

gcr_name=k8s.gcr.io
myhub_name=litchi0509
# define images 
images=(
 k8s.gcr.io/kube-apiserver:v1.16.3
 k8s.gcr.io/kube-controller-manager:v1.16.3
 k8s.gcr.io/kube-scheduler:v1.16.3
 k8s.gcr.io/kube-proxy:v1.16.3
 k8s.gcr.io/pause:3.1
 k8s.gcr.io/etcd:3.3.15-0
 k8s.gcr.io/coredns:1.6.2
)

for image in ${images[@]}; do 
	docker pull $myhub_name/$image
	docker tag  $myhub_name/$image $gcr_name/$image
	docker rmi $myhub_name/$image
done
