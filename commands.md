#### Get pods
kubectl get pods

#### Get pod <podname>
kubectl get pod <podname>

#### Generate secret key
python3 -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"

#### Generate secret
python3 -c "import secrets; print(secrets.token_urlsafe(32))

#### Create Kubectl secret
kubectl create secret generic <secret-name> --from-env-file=./.env

#### Get secrets
kubectl get secrets

#### Get secret <secret-name>
kubectl get secret kt-k8s -o yaml

#### Get service account
kubectl get serviceaccount -o yaml

#### Delete secret
kubectl delete secret <secret-name>

#### Create Kube secret
kubectl create secret generic <secret-name> --from-env-file=./env.prod