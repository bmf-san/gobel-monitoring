# gobel-example
Gobel is a headless cms built with golang. 

This repository contains the code to run gobel in each environment.

Both local environment and production environment are assumed to be operated with docker-compose.

# gobel
- [gobel-api](https://github.com/bmf-san/gobel-api)
- [gobel-client-example-example](https://github.com/bmf-san/gobel-client-example-example)
- [gobel-admin-client-example-example](https://github.com/bmf-san/gobel-admin-client-example-example)
- [gobel-example](https://github.com/bmf-san/gobel-example)
- [gobel-ops-example](https://github.com/bmf-san/gobel-ops-example)

# Get started
## Docker Compose
Work in `./docker-compose` directory.

### Create a network
`docker network create --driver bridge gobel_link`

### Edit files
#### environtment files
Copy each .env_example under the following directory and edit it as needed.

#### config files
##### fluent.conf
`fluentd/config/fluent.conf`

```
    user elastic // here
    password password // here
```

##### kibana.yml
`kibana/config/kibana.yml`

```
server.name: kibana
server.host: "0"
elasticsearch.hosts: [ "http://elasticsearch:9200" ]
xpack.monitoring.ui.container.elasticsearch.enabled: true
elasticsearch.username: admin // here
elasticsearch.password: password // here
```

### Edit a /etc/hosts.
```
127.0.0.1 gobel-api.local
127.0.0.1 gobel-client-example.local
127.0.0.1 gobel-admin-client-example.local
```

### Build containers
```
make docker-compose-build
```

### Run containers
```
make docker-compose-up
```

or

```
make docker-compose-up-d
```

## Go to applications
|            Application             |                   URL                    |
| ---------------------------------- | ---------------------------------------- |
| gobel-api                          | http://gobel-api.local/                  |
| gobel-admin-client-example-example | http://gobel-admin-client-example.local/ |
| gobel-client-example               | http://gobel-client-example.local/       |
| prometheus                         | http://localhost:9090/graph              |
| node-exporter                      | http://localhost:9100/                   |
| mysqld-exporter                    | http://localhost:9104/                   |
| grafana                            | http://localhost:3000/                   |
| kibana                             | http://0.0.0.0:5601/                     |

# License
This project is licensed under the terms of the MIT license.

# Author
bmf - Software engineer.

- [github - bmf-san/bmf-san](https://github.com/bmf-san/bmf-san)
- [twitter - @bmf-san](https://twitter.com/bmf_san)
- [blog - bmf-tech](http://bmf-tech.com/)
