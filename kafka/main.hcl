container "zookeeper" {
    network {
        name = "network.local"
    }

    image {
        name = "confluentinc/cp-zookeeper:6.2.0"
    }

    env {
        key   = "ZOOKEEPER_CLIENT_PORT"
        value = 2181
    }
    env{
        key   = "ZOOKEEPER_TICK_TIME"
        value = 2000
    }
    port {
        local  = 2181
        remote = 2181
        host   = 2181
    }
}

container "broker" {
    network {
        name = "network.local"
    }

    image {
        name = "confluentinc/cp-server:6.2.0"
    }

    env {
        key   = "KAFKA_BROKER_ID"
        value = 1
    }
    
    env {
        key   = "KAFKA_ZOOKEEPER_CONNECT"
        value = "${shipyard_ip()}:2181"
    }
    
    env {
        key   = "KAFKA_ADVERTISED_LISTENERS"
        value = "PLAINTEXT://${shipyard_ip()}:9092"
    }

    port {
        local  = 9092
        remote = 9092
        host   = 9092
    }
}

container "kafka-ui" {
    network {
        name = "network.local"
    }

    image {
        name = "provectuslabs/kafka-ui:latest"
    }

    env {
        key   = "KAFKA_CLUSTERS_0_NAME"
        value ="kafka"
    }
    
    env {
        key   = "KAFKA_CLUSTERS_0_ZOOKEEPER"
        value ="${shipyard_ip()}:2181"
    }
    
    env {
        key   = "KAFKA_CLUSTERS_0_BOOTSTRAPSERVERS"
        value ="${shipyard_ip()}:9092"
    }

    port {
        local  = 8080
        remote = 8080
        host   = 8080

        open_in_browser = "/"
    }
}
    