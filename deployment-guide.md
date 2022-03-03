1. Test Django
```
python manage.py test
````

2. Build Container

```
docker build -f Dockerfile \
  -t registry.digitalocean.com/kt-k8s/django-k8s-web:latest \
  -t registry.digitalocean.com/kt-k8s/django-k8s-web:v1 \
  .
```

3. Push container to DO container registry

```
docker push registry.digitalocean.com/kt-k8s/django-k8s-web --all-tags
```

4. Update secrets

```
kubectl delete secret django-k8s-prod-env
kubectl create secret generic django-k8s-prod-env --from-env-file=./.env.prod
```

5. Update Deployment

```
kubectl appy -f k8s/apps/django-k8s-deployment.yaml
```

6. Wait for rollout to finish

```
kubectl rollout status deployment/django-k8s-deployment
```

7. Migrate

```
export SINGLE_POD_NAME=$(kubectl get pod -l app=django-k8s-deployment -o jsonpath={.items[0].metadata.name})

or export SINGLE_POD_NAME=$(kubectl get pod -l app=django-k8s-deployment -o NAME | tail -n 1)

kubectl exec -it $SINGLE_POD_NAME -- bash /app/migrate.sh
```