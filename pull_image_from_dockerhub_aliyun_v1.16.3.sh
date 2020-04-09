  
#!/bin/bash

gcr_name=k8s.gcr.io
myhub_name=registry.cn-hangzhou.aliyuncs.com/google_containers
# define images 
images=(
 kubernetes-dashboard-amd64:v1.10.1
 kube-apiserver:v1.18.1
 kube-controller-manager:v1.18.1
 kube-scheduler:v1.18.1
 kube-proxy:v1.18.1
 pause:3.2
 etcd:3.4.3-0
 coredns:1.6.7
)

for image in ${images[@]}; do 
	docker pull $myhub_name/$image
	docker tag  $myhub_name/$image $gcr_name/$image
	docker rmi $myhub_name/$image
done
