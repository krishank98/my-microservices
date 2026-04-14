# 👤 Namespace
apiVersion: v1
kind: Namespace
metadata:
  name: krish

---
# 🔐 Role (namespace-level permissions)
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: krish-role
  namespace: krish
rules:
  - apiGroups: [""]
    resources: ["pods", "services", "configmaps"]
    verbs: ["get", "list", "watch", "create", "delete"]

  - apiGroups: ["apps"]
    resources: ["deployments"]
    verbs: ["get", "list", "watch", "create", "update", "delete"]

---
# 🔗 RoleBinding (bind user to role)
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: krish-rolebinding
  namespace: krish
subjects:
  - kind: User
    name: krish-test   # 👈 your user
    apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: krish-role
  apiGroup: rbac.authorization.k8s.io
