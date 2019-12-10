  
#!/bin/bash

gcr_name=k8s.gcr.io
myhub_name=registry.cn-hangzhou.aliyuncs.com/google_containers
# define images 
images=(
 kubernetes-dashboard-amd64:v1.10.1
 kube-apiserver:v1.16.3
 kube-controller-manager:v1.16.3
 kube-scheduler:v1.16.3
 kube-proxy:v1.16.3
 pause:3.1
 etcd:3.3.15-0
 coredns:1.6.2
)

for image in ${images[@]}; do 
	docker pull $myhub_name/$image
	docker tag  $myhub_name/$image $gcr_name/$image
	docker rmi $myhub_name/$image
done
