# gobel-example
Gobel is a headless cms built with golang. 

This ia a production ready example.

# gobel
- [gobel-api](https://github.com/bmf-san/gobel-api)
- [gobel-client-example-example](https://github.com/bmf-san/gobel-client-example-example)
- [gobel-admin-client-example](https://github.com/bmf-san/gobel-admin-client-example)
- [gobel-example](https://github.com/bmf-san/gobel-example)

# Get started
## Create a network
`docker network create --driver bridge gobel_link`

## Edit environment variables and credentials
### docker-compose.yml
#### gobel-mysql
```yml
environment: 
    MYSQL_DATABASE: gobel // here
    MYSQL_ROOT_PASSWORD: password // here
```

#### redis
```yml
environment: 
    REDIS_PASSWORD: password // here
```

# nginx
```yml
args:
    VUE_APP_API_ENDPOINT: "http://gobel-api.local"
```

#### gobel-api
```yml
environment: 
    SERVER_PORT: 8080
    TIME_ZONE: Asia/Tokyo
    ALLOW_ORIGIN: "*"
    DB_DRIVER: mysql
    DB_USER: root // here
    DB_PASSWORD: password // here
    DB_HOST: gobel-mysql
    DB_PORT: 3306
    DB_DATABASE: gobel // here
    MYSQL_DATABASE: gobel // here
    MYSQL_ROOT_PASSWORD: password // here
    REDIS_HOST: redis
    REDIS_PORT: 6379
    REDIS_PASSWORD: password // here
```

#### grafana
```yml
environment: 
    GF_SECURITY_ADMIN_USER: admin // here
    GF_SECURITY_ADMIN_PASSWORD: password // here
    GF_USERS_ALLOW_SIGN_UP: "false"
    GF_USERS_ALLOW_ORG_CREATE: "false"
    DS_PROMETHEUS: Prometheus
```

#### elasticsearch
```yml
environment:
    ES_JAVA_OPTS: "-Xmx256m -Xms256m"
    ELASTIC_PASSWORD: password // here
    discovery.type: single-node
```

### fluent.conf
`fluentd/config/fluent.conf`

```
    user elastic // here
    password password // here
```

### kibana.yml
`kibana/config/kibana.yml`

```
server.name: kibana
server.host: "0"
elasticsearch.hosts: [ "http://elasticsearch:9200" ]
xpack.monitoring.ui.container.elasticsearch.enabled: true
elasticsearch.username: admin // here
elasticsearch.password: password // here
```

## Docker compose
### Edit a /etc/hosts.
```
127.0.0.1 gobel-api.local
127.0.0.1 gobel-client-example.local
127.0.0.1 gobel-admin-client.local
```

### Build containers
```
make build
```

### Run containers
```
make up
```

or

```
make up-d
```

### Go to applications
|     Application      |                URL                 |
| -------------------- | ---------------------------------- |
| gobel-api            | http://gobel-api.local/            |
| gobel-admin-client   | http://gobel-admin-client.local/   |
| gobel-client-example | http://gobel-client-example.local/ |
| prometheus           | http://localhost:9090/graph        |
| node-exporter        | http://localhost:9100/             |
| mysqld-exporter      | http://localhost:9104/             |
| grafana              | http://localhost:3000/             |
| kibana               | http://0.0.0.0:5601/               |

## Kubernetes
// TODO:
