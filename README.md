# Shipyard.run stacks

All stacks use `network.local`. It should be setup before using modules.

```hcl
network "local" {
    subnet = "10.0.0.0/16"
}
```

## ScyllaDB

Single scylla node for development.

Scylla will be available on `localhost:9042` with `cassandra:cassandra` super user.

```hcl
module "scylladb" {
    source = "github.com/artyomturkin/shipyard-blueprints//scylladb"
}
```

## Apache Kafka

Runs Apache Kafka with a single zookeeper and single broker.

In addition kafka-ui is started for the cluster.

```hcl
module "kafka" {
    source = "github.com/artyomturkin/shipyard-blueprints//kafka"
}
```
