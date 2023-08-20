# BP code

## Container Attached Storage solutions
- OpenEBS
- Portworx
- Rook/Ceph
- Longhorn
- Robin
- Ondat (StorageOS)





## Gcloud shell link cluster
```
gcloud container clusters get-credentials bp-cluster \
    --region=europe-west1-c
```

# Postgres CNPG cluster
operator
```
helm repo add cnpg https://cloudnative-pg.github.io/charts
helm repo update
helm upgrade --install cnpg \
  --namespace cnpg-system \
  --create-namespace \
  cnpg/cloudnative-pg
```

plugin
```
curl -sSfL \
  https://github.com/cloudnative-pg/cloudnative-pg/raw/main/hack/install-cnpg-plugin.sh | \
  sudo sh -s -- -b /usr/local/bin
```

Cluster status
```
Kubectl cnpg status postgres-cluster
```

## Benchmark
https://cloudnative-pg.io/documentation/1.20/benchmarking/ 

Initialize test database
```
kubectl cnpg pgbench --job-name pgbench-init postgres-cluster -- --initialize --scale 1000
```

Check progress
```
kubectl logs job/pgbench-init -f
```

Run benchmark (10min = 600s)
```
kubectl cnpg pgbench --job-name pgbench-run postgres-cluster -- --time 600 -P 30
```

Check progress
```
kubectl logs job/pgbench-run -f
```

Remove test database tabels
```
kubectl cnpg pgbench --job-name pgbench-delete postgres-cluster -- -I d
```