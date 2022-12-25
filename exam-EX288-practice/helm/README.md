

Changes to helm chart
1) Image set as custom apache image 
2) replica count 2
3) set labels in _helper file tag: latest
4) change ports to 8080
5) set affinity to AnitiAffinity :
6) set liveness and readiness probes


Note since we have set anitaffinity to not to run two pods on same hostname if you have only one node in cluser then one pod will be created and will be in "running" status but other pod with be created but it will be in "pending" status

