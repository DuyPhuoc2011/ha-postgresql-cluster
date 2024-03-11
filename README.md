# High Availability PostgreSQL Deployment Guide

This guide provides step-by-step instructions for deploying a High Availability (HA) PostgreSQL cluster. The HA setup ensures that your PostgreSQL database remains available even in the event of hardware or software failures.

## Architecture

<img width="566" alt="image" src="https://github.com/DuyPhuoc2011/ha-postgresql-cluster/assets/23703707/4559b46b-7db9-44c8-acef-8b744ac6b54c">


## Prerequisites

Before you begin, make sure you have the following prerequisites in place:

- A cluster of servers or virtual machines to host the PostgreSQL instances. We would have 3 nodes of PostgreSQL instances that run on Ubuntu operation system.
- A load balancer or proxy server to distribute client connections across the PostgreSQL instances. We would have a node to host a haproxy for routing traffics to PostgreSQL instances.
- A etcd server. We would have a node to host a etcd server.
- Basic knowledge of PostgreSQL administration and Linux system administration.
## Installation

1. Setup node1, node2 and node3

```shell
./nodes-pre-installation.sh node1
./nodes-pre-installation.sh node2
./nodes-pre-installation.sh node3
```

2. Setup etcd node
```
./etcd-node-pre-installation.sh
```
3. Setup haproxy node
```
./ha-proxy-pre-installation.sh
```
4. Configure etcd on etcd node

  Modify file with this path "/etc/default/etcd" and add add lines in the etcd-configure file of this repository.

  Restart etcd service
  ```
  sudo systemctl restart etcd
  ```

5. Configure Patroni on node1,node2 and node3

  Modify file with this path "/etc/patroni.yaml" and add lines in the patroni.yaml file of this repository
  
  Note: Update corresponding IP address for each nodes

  Initial data folder for each node:
```
sudo mkdir -p /data/patroni
sudo chown postgres:postgres /data/patroni
sudo chmod 700 /data/patroni
```
Create new service file for patroni with this path "/etc/systemd/system/patroni.service"
Add lines in the patroni.service file of this repository

6. Start patroni service
```
sudo systemctl start patroni
```
7. Configure haproxy

Modify file with this path "/etc/haproxy/haproxy.cfg" and replace lines with the lines in the file haproxy.cfg of this repository

Note: Update corresponding IP address for each nodes

8. Start haproxy service
```
sudo systemctl start haproxy
```
## Troubleshooting

If you encounter any issues during the deployment or operation of the HA PostgreSQL cluster, refer to the following resources for troubleshooting:

- PostgreSQL documentation: https://www.postgresql.org/docs/
- PostgreSQL mailing lists and forums: https://www.postgresql.org/community/
- Patroni template provider: https://github.com/zalando/patroni

## Contributing

Contributions to this deployment guide are welcome! If you have any suggestions or improvements, please submit a pull request or open an issue on the GitHub repository.
