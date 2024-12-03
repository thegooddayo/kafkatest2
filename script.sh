# Deploy all services regarding kafka
# chmod +x script.sh
# ./script.sh
kubectl apply -f secrets.yaml
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus  prometheus-community/prometheus -f prometheus.yaml
helm install kafka kafka/ -f ./kafka/kafka-values.yaml 
helm install conduktor conduktor/ -f conduktor/conduktor-values.yaml
helm install kafka-connect kafka-connect -f kafka-connect/values.yaml


# helm uninstall kafka
# helm uninstall kafka-connect
# helm uninstall prometheus
# helm uninstall conduktor
# kubectl delete -f secrets.yaml