
kubectl top nodes

kubectl label node ip-10-16-154-180.ec2.internal cpu-node=2cpu

kubectl get nodes --show-labels

kubectl taint nodes ip-10-16-140-92.ec2.internal cpu-node:NoSchedule

kubectl describe node ip-10-16-140-92.ec2.internal | grep -i taint
kubectl taint nodes ip-10-16-140-92.ec2.internal cpu-node:NoSchedule-
