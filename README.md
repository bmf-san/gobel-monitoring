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

# UI screenshots
## gobel-client-example
An example application using gobel-api.

<img src="https://user-images.githubusercontent.com/13291041/121388155-33652780-c986-11eb-9076-985b7113b0a9.png" alt="drawing" width="400"/>

## gobel-admin-client-example
An example application using gobel-api for admin.

<img src="https://user-images.githubusercontent.com/13291041/121388150-32cc9100-c986-11eb-86d5-2782bdb6193b.png" alt="drawing" width="400"/>

## Grafana
A dashboard for monitoring various logs in cooperation with prometheus using cAdvisor, mysqld-exporter and node-exporter.

### Container monitoring
Monitor the resource usage and performance characteristics of running containers.

<img src="https://user-images.githubusercontent.com/13291041/121389800-b8047580-c987-11eb-9814-291498c74bd7.png" alt="drawing" width="400"/>

### MySQL Overview
Monitor the MySQL server metrics.

<img src="https://user-images.githubusercontent.com/13291041/121390045-f5690300-c987-11eb-8a1c-d3b4f278e23c.png" alt="drawing" width="400"/>

### Node Exporter Full
Monitor system metrics provided by node exporter.

<img src="https://user-images.githubusercontent.com/13291041/121389862-c8b4eb80-c987-11eb-9be9-2752c13b9218.png" alt="drawing" width="400"/>

## Prometheus
Prometheus is an open-source systems monitoring and alerting toolkit.
Poll the exporter to collect resources and manage data.

<img src="https://user-images.githubusercontent.com/13291041/121389083-0402ea80-c987-11eb-98a5-50908aa36372.png" alt="drawing" width="400"/>

## Node exporter
Node exporter collects system metrics.

<img src="https://user-images.githubusercontent.com/13291041/121389071-006f6380-c987-11eb-85bc-14f0e96b2cbc.png" alt="drawing" width="400"/>

## MySQL exporter
MySQL exporter collects MySQL server metrics.

<img src="https://user-images.githubusercontent.com/13291041/121389074-01a09080-c987-11eb-968e-dc7ae9d3c29c.png" alt="drawing" width="400"/>

## Kibana
Visualization of logs in cooperation with elasticsearch and fluentd.

- Application log
  - gobel-api-*
  - gobel-clientexample-*
- DB log
  - mysql-slow-*
- Web server log
  - nginx-access-*
  - nginx-error-*

<img src="https://user-images.githubusercontent.com/13291041/121389862-c8b4eb80-c987-11eb-9be9-2752c13b9218.png" alt="drawing" width="400"/>

# License
This project is licensed under the terms of the MIT license.

# Author
bmf - Software engineer.

- [github - bmf-san/bmf-san](https://github.com/bmf-san/bmf-san)
- [twitter - @bmf-san](https://twitter.com/bmf_san)
- [blog - bmf-tech](http://bmf-tech.com/)
