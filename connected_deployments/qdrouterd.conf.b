router {
    mode: interior
    id: Router.cluster-b.${HOSTNAME}
}

listener {
    host: 0.0.0.0
    port: amqp
    authenticatePeer: no
    saslMechanisms: ANONYMOUS
}

listener {
    host: 0.0.0.0
    port: 5671
    sslProfile: ssl_details
    authenticatePeer: no
    requireSsl: true
}

listener {
    host: 0.0.0.0
    port: 55672
    role: inter-router
    authenticatePeer: yes
    sslProfile: ssl_internal_details
    saslMechanisms: EXTERNAL
}

listener {
    host: 0.0.0.0
    port: 56722
    role: route-container
    authenticatePeer: yes
    sslProfile: ssl_internal_details
    saslMechanisms: EXTERNAL
}

sslProfile {
   name: ssl_details
   certFile: /etc/qpid-dispatch-certs/external/tls.crt
   keyFile: /etc/qpid-dispatch-certs/external/tls.key
}

sslProfile {
   name: ssl_internal_details
   certFile: /etc/qpid-dispatch-certs/internal/tls.crt
   keyFile: /etc/qpid-dispatch-certs/internal/tls.key
   certDb: /etc/qpid-dispatch-certs/internal/ca.crt
}

address {
    prefix: closest
    distribution: closest
}

address {
    prefix: multicast
    distribution: multicast
}

address {
    prefix: unicast
    distribution: closest
}

address {
    prefix: exclusive
    distribution: closest
}

address {
    prefix: broadcast
    distribution: multicast
}
