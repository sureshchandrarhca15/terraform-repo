## Deploy Nginx ## 

./helm repo add my-repo https://charts.bitnami.com/bitnami

./helm install my-release my-repo/nginx --set service.type=LoadBalancer --namespace services

NAME: my-release
LAST DEPLOYED: Thu Apr 20 06:26:24 2023
NAMESPACE: services
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
CHART NAME: nginx
CHART VERSION: 13.2.34
APP VERSION: 1.23.4


./kubectl get pod -n services
NAME                               READY   STATUS    RESTARTS   AGE
my-release-nginx-6cbc46b6c-4qdrm   1/1     Running   0          11s


./kubectl get svc -n services
NAME               TYPE           CLUSTER-IP   EXTERNAL-IP      PORT(S)        AGE
my-release-nginx   LoadBalancer   10.28.8.14   34.168.205.130   80:31870/TCP   37s




## Deploy Prometheus and Grafana ## 

./helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

./helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring
NAME: prometheus
LAST DEPLOYED: Thu Apr 20 06:34:00 2023
NAMESPACE: monitoring
STATUS: deployed
REVISION: 1


./kubectl get pod -n monitoring
NAME                                                     READY   STATUS    RESTARTS        AGE
alertmanager-prometheus-kube-prometheus-alertmanager-0   2/2     Running   1 (4m20s ago)   4m24s
prometheus-grafana-b88fcc99b-vfm4s                       3/3     Running   0               4m31s
prometheus-kube-prometheus-operator-6665c45579-jb59p     1/1     Running   0               4m31s
prometheus-kube-state-metrics-858496487b-8268t           1/1     Running   0               4m31s
prometheus-prometheus-kube-prometheus-prometheus-0       2/2     Running   0               4m24s
prometheus-prometheus-node-exporter-2pk86                1/1     Running   0               4m31s
prometheus-prometheus-node-exporter-qnvgr                1/1     Running   0               4m31s
prometheus-prometheus-node-exporter-twkvn                1/1     Running   0               4m31s


./kubectl get svc -n monitoring
NAME                                      TYPE           CLUSTER-IP     EXTERNAL-IP     PORT(S)                      AGE
alertmanager-operated                     ClusterIP      None           <none>          9093/TCP,9094/TCP,9094/UDP   7m23s
prometheus-grafana                        LoadBalancer   10.28.12.71    34.83.217.191   80:31438/TCP                 7m30s
prometheus-kube-prometheus-alertmanager   ClusterIP      10.28.5.135    <none>          9093/TCP                     7m30s
prometheus-kube-prometheus-operator       ClusterIP      10.28.3.16     <none>          443/TCP                      7m30s
prometheus-kube-prometheus-prometheus     ClusterIP      10.28.6.86     <none>          9090/TCP                     7m30s
prometheus-kube-state-metrics             ClusterIP      10.28.11.241   <none>          8080/TCP                     7m30s
prometheus-operated                       ClusterIP      None           <none>          9090/TCP                     7m22s
prometheus-prometheus-node-exporter       ClusterIP      10.28.8.13     <none>          9100/TCP                     7m30s
