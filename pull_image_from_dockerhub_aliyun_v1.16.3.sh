  
#!/bin/bash

gcr_name=k8s.gcr.io
myhub_name=registry.cn-hangzhou.aliyuncs.com/google_containers
KUBE_DASHBOARD_VERSION=v1.10.1
KUBE_VERSION=v1.18.2
KUBE_PAUSE_VERSION=3.2
ETCD_VERSION=3.4.3-0
DNS_VERSION=1.6.7

# define images 
images=(
 kubernetes-dashboard-amd64:${KUBE_DASHBOARD_VERSION}
 kube-apiserver:${KUBE_VERSION}
 kube-controller-manager:${KUBE_VERSION}
 kube-scheduler:${KUBE_VERSION}
 kube-proxy:${KUBE_VERSION}
 pause:${KUBE_PAUSE_VERSION}
 etcd:${ETCD_VERSION}
 coredns:${DNS_VERSION}
)

for image in ${images[@]}; do 
	docker pull $myhub_name/$image
	docker tag  $myhub_name/$image $gcr_name/$image
	docker rmi $myhub_name/$image
done
