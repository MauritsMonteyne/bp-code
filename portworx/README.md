# Portworx setup





platform DAS/SAN

Distribution None

```
kubectl apply -f 'https://install.portworx.com/2.13?comp=pxoperator&kbver=1.27.3&ns=portworx'
```

W8 few minutes and check status running
```
kubectl get pods -n portworx
```

Apply portworx storagecluster 
```
kubectl apply -f 'https://install.portworx.com/2.13?operator=true&mc=false&kbver=1.27.3&ns=portworx&oem=esse&user=258101f4-099a-46f2-9a45-e2e68d96985e&b=true&c=px-cluster-52ea4b45-df38-42bd-a86c-3eeec8eb9eb5&stork=true&csi=true&mon=true&tel=true&st=k8s&promop=true'
```


Verify 
```
kubectl apply -f portworx-sc
```


=> ready