container "scylla" {
    network {
        name = "network.local"
    }

    image {
        name = "scylladb/scylla:latest"
    }

    command = [
        "--authenticator",
        "PasswordAuthenticator",
        "--authorizer",
        "CassandraAuthorizer",
    ]
    port {
        local = 9042
        remote  = 9042
        host = 9042
    }
}