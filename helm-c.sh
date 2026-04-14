# BASIC
helm version
helm list
helm list -A

# CREATE / STRUCTURE
helm create myapp
helm show chart myapp
helm show values myapp

# VALIDATE / RENDER
helm lint .
helm template myapp .
helm template myapp . -f values.yaml

# INSTALL
helm install myapp .
helm install myapp . -f values.yaml
helm install myapp ./myapp --namespace dev --create-namespace

# UPGRADE
helm upgrade myapp .
helm upgrade myapp . -f values.yaml
helm upgrade --install myapp .

# DELETE / ROLLBACK
helm uninstall myapp
helm rollback myapp 1

# DEBUG / INFO
helm status myapp
helm get all myapp
helm history myapp
