
https://openebs.io/docs/stateful-applications/postgres
https://gist.github.com/kmova/1c15a0ca5e63a24d7ae1718496175b23

https://medium.com/harsh-thakur/deploy-mayastor-on-gke-784ad28babd9


docs raden localpv data engine aan voor database


Create binding
```
kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=maurits.monteyne@gmail.com
```

Install operator
```
helm install openebs openebs/openebs --namespace openebs --create-namespace \
--set legacy.enabled=false \
--set localpv-provisioner.enabled=true \
--set openebs-ndm.enabled=true
```

=> Ready
OpenEBS vindt automatisch disks en maakt PV wanneer PVC komt
