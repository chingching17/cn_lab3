kubectl delete pod,deploy,svc,ingress --all
kubectl apply -f deploy-backend.yaml
kubectl apply -f deploy-db.yaml
kubectl apply -f deploy-frontend.yaml
kubectl apply -f svc-frontend.yaml
kubectl apply -f svc-db.yaml
kubectl apply -f svc-backend.yaml
kubectl apply -f ingress.yaml