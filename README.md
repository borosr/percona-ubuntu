# Percona Ubuntu
## Ubuntu 16.04

This is an implementation of percona MySQL database. Click to <a href="https://github.com/borosr/percona-ubuntu">link</a> for more info.

### Usage
```bash
docker run --name my-percona -e MYSQL_ROOT_PASSWORD=password -d -p 3306:3306 borosr/percona-ubuntu
```