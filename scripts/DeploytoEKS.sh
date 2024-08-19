 #!/bin/bash


echo "deploying to development Environment EKS Cluster "

kubectl apply -f ./kubernetes/Spring-Boot -n $KUBE_NAMESPACE

kubectl apply -f ./kubernetes/Spring-Boot-Live -n $KUBE_NAMESPACE