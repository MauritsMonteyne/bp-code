# Longhorn

Create binding
```
kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=maurits.monteyne@gmail.com
```


Install operator with helm
```
helm repo add longhorn https://charts.longhorn.io
helm repo update
helm install longhorn longhorn/longhorn --namespace longhorn-system --create-namespace --version 1.5.1 --set defaultSetting.defaultDataPath="/mnt/disks/ssd0"
```

Verify install (status running)
```
kubectl -n longhorn-system get pod
```

Create cluster

```yaml
---
apiVersion: postgresql.cnpg.io/v1
kind: Cluster
metadata:
  name: postgres-cluster
spec:
  instances: 3

  storage:
    storageClass: longhorn
    size: 32Gi

  resources:
    requests:
      cpu: "2"
      memory: "4Gi"
    limits:
      cpu: "2"
      memory: "8Gi"
```
