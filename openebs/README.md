
https://openebs.io/docs/stateful-applications/postgres

https://medium.com/harsh-thakur/deploy-mayastor-on-gke-784ad28babd9





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
