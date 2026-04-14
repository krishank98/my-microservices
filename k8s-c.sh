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

# 🔹 LABELS

# Add label to node
kubectl label nodes <node-name> env=prod

# Add label to pod
kubectl label pod <pod-name> app=frontend

# Show labels
kubectl get nodes --show-labels
kubectl get pods --show-labels

# Remove label
kubectl label nodes <node-name> env-


# 🔹 TAINTS

# Add taint to node
kubectl taint nodes <node-name> key=value:NoSchedule

# Example
kubectl taint nodes minikube dedicated=db:NoSchedule

# View taints
kubectl describe node <node-name> | grep Taint

# Remove taint (UNTAINT)
kubectl taint nodes <node-name> key=value:NoSchedule-


# 🔹 CONTEXT (KUBECONFIG)

# View current context
kubectl config current-context

# List all contexts
kubectl config get-contexts

# Switch context
kubectl config use-context <context-name>

# Set default namespace for current context
kubectl config set-context --current --namespace=krish

# View full config
kubectl config view
