# BASIC / CLUSTER
kubectl get nodes
kubectl get pods
kubectl get svc
kubectl get all
kubectl cluster-info

# DETAILED INFO
kubectl describe pod <pod>
kubectl describe node <node>
kubectl describe svc <service>

# LOGS & DEBUGGING
kubectl logs <pod>
kubectl logs <pod> -f
kubectl exec -it <pod> -- sh
kubectl top pods
kubectl top nodes

# APPLY / DELETE
kubectl apply -f file.yaml
kubectl delete -f file.yaml
kubectl delete pod <pod>

# SCALING / DEPLOYMENT
kubectl scale deployment <name> --replicas=3
kubectl rollout status deployment <name>
kubectl rollout restart deployment <name>
kubectl rollout undo deployment <name>

# NETWORK / SERVICE
kubectl port-forward svc/<service> 8080:80
kubectl get ingress
kubectl get endpoints

# ADVANCED
kubectl get pods -o wide
kubectl get pods -A
kubectl get pvc
kubectl get pv
kubectl get events
