First create a secret named `qdr-cert` containing a TLS key and
certificate for the router. E.g.

```
mkdir -p qdr-cert
openssl req -new -x509 -batch -nodes -days 11000 -subj "/O=io.enmasse/CN=messaging.mynamespace.svc.cluster.local" -out qdr-cert/tls.crt -keyout qdr-cert/tls.key
kubectl create secret tls qdr-cert --cert=qdr-cert/tls.crt --key=qdr-cert/tls.key
```

Then create a configmap named `qdr-conf` with the desired router
config. E.g.

```
kubectl create configmap qdr-config --from-file=qdrouterd.conf.template=qdrouterd.conf.template
```

Then the router can be deployed with:

```
kubectl apply -f qdr.yaml
```