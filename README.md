# roxy
Roxy is a services aware reverse proxy, as a Docker image, for Docker containers.

![](https://img.shields.io/docker/stars/ebuildy/roxy.svg?style=for-the-badge)
![](https://img.shields.io/docker/pulls/ebuildy/roxy.svg?style=for-the-badge)
![](https://img.shields.io/docker/automated/ebuildy/roxy.svg?style=for-the-badge)
![](https://img.shields.io/docker/build/ebuildy/roxy.svg?style=for-the-badge)

![roxy screenshot](https://github.com/ebuildy/roxy/raw/master/.assets/roxy.png)

When container starts, before running Nginx HTTP server, Roxy generates:
* Nginx configuration
* index.html

From jinja2 templates, via a simple python script that get data from a YML file.

## Usage

### data.yaml

This file contains the list of the services you want to proxy, map sub-domain to URL or IP.

```
services:

    es:
        backends:
        - address: elasticsearch:9200
        tags: ["data"]

    mail:
        backends:
        - address: mailer:1080
        tags: ["viz"]

    spark:
      backends:
      - address: spark:8080
      tags: ["spark"]

settings:
  title: SubitoLabs - Djobi
  tags:
    hadoop: "#1abc9c"
    yarn: "#f1c40f"
    monit: "#e74c3c"
    sql: "#2980b9"
    spark: "#8e44ad"
    data: "#2ecc71"
    viz: "#22ff00"
  nginx:
    dns:
      resolver: 127.0.0.11
```

### run !

* Must run on port 80

``docker run -p 80:80 -v /PATH/data.yml:/opt/roxy/data.yml -e ROXY_WEB_DOMAIN=test.127.0.0.1.xip.io --name roxy ebuildy/roxy:0.1.3``
