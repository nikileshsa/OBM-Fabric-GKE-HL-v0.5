kubectl get pods,ds,rs,rc,svc --all-namespaces -o wide

alias kube-hl='kubectl get --namespace=hyperledger ns,pods,ds,rs,rc,svc'
alias kube-mgt='kubectl get --namespace=management ns,pods,ds,rs,rc,svc'

export CONTEXT=$(kubectl config view | awk '/current-context/ {print $2}')

kubectl config set-context $CONTEXT --namespace=hyperledger

kubectl config set-context $CONTEXT --namespace=management

Prometheus
http://<Public IP>:9090/graph
sum(container_memory_usage_bytes{kubernetes_namespace="hyperledger"})
sum(rate(apiserver_request_count[1m]))

