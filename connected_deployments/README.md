An example showing three inter-connected deployments in separate
namespaces. This could easily be adapted to work with three separate
clusters, as the inter-router connection is done over external routes.

Startup cluster, e.g.:

oc cluster up

Create three projects called cluster-a, cluster-b and cluster-local. For
each project:

* create a secret called qdr-internal-cert containing the internal tls
  certificates and key to use between routers

* create a configmap called qdr-config containing the router config to
  use (i.e. qdrouterd.conf.a, qdrouterd.conf.b or qdrouterd.conf.local
  as appropriate)

* create deployment, secret and route (using qdr.yaml.a, qdr.yaml.b or
  qdr.yaml.local as appropriate)

This can all be done by running the setup script.

To verify:

qdstat -b $(oc get service messaging -n cluster-a -o jsonpath='{.spec.clusterIP}') -n
qdstat -b $(oc get service messaging -n cluster-b -o jsonpath='{.spec.clusterIP}') -n
qdstat -b $(oc get service messaging -n cluster-local -o jsonpath='{.spec.clusterIP}') -n
