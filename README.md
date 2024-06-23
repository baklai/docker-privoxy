# Privoxy & Tor proxy

![Privoxy + Tor](preview.png)

A fast, minimalist proxy system using [Privoxy](https://www.privoxy.org) and [Tor](https://www.torproject.org) for unrestricted internet browsing.

About Privoxy

Privoxy is a non-caching web proxy with advanced filtering capabilities for enhancing privacy, modifying web page data and HTTP headers, controlling access, and removing ads and other obnoxious Internet junk. Privoxy has a flexible configuration and can be customized to suit individual needs and tastes. It has application for both stand-alone systems and multi-user networks.

About Tor

The goal of onion routing was to have a way to use the internet with as much privacy as possible, and the idea was to route traffic through multiple servers and encrypt it each step of the way. This is still a simple explanation for how Tor works today.

## Quick Start

The quickest way to get started is using [docker compose](https://docs.docker.com/compose/).

```bash
wget https://raw.githubusercontent.com/baklai/privoxy-tor-proxy/main/compose.yaml

# When you're ready, start application by running
docker compose up --build
```

Access your proxy at `http://localhost:8118`.

### Running application

```bash
# Launch image locally
docker run -d --name privoxy-tor-proxy -p 8118:8118 baklai/privoxy-tor-proxy:latest
```

Access your proxy at `http://localhost:8118`.

#### Parameters

| Parameter                                | Description                               |
| ---------------------------------------- | ----------------------------------------- |
| `-e TZ=UTC`                              | Timezone                                  |
| `-p 8118:8118`                           | Expose the proxy service                  |
| `-v /path/to/logs:/var/log/privoxy`      | Volume to store privoxy logs              |
| `-v /path/to/data:/var/spool/privoxy`    | Volume to store the privoxy cache         |
| `-v /path/to/config:/etc/privoxy/config` | Main privoxy configuration file           |
| `-v /path/to/config:/etc/privoxy/`       | Configuration snippets included by config |

#### Testing/Debugging

To debug the container:

```bash
docker logs -f privoxy-tor-proxy
```

To get an interactive shell:

```bash
docker exec -it privoxy-tor-proxy /bin/bash
```

## Deploying application to the cloud

First, build docker image, e.g.:

```bash
docker build -t baklai/privoxy-tor-proxy .
```

If your cloud uses a different CPU architecture than your development
machine (e.g., you are on a Mac M1 and your cloud provider is amd64),
you'll want to build the image for that platform, e.g.:

```bash
docker build --platform=linux/amd64,linux/arm/v7,linux/arm64/v8,linux/ppc64le,linux/s390x -t baklai/privoxy-tor-proxy .
```

Then, push it to your registry, e.g.

```bash
docker push baklai/privoxy-tor-proxy
```

Consult Docker's [getting started](https://docs.docker.com/go/get-started-sharing/)
docs for more detail on building and pushing.

## License

[MIT](LICENSE)
