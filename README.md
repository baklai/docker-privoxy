# Privoxy & Tor proxy

![Privoxy + Tor](preview.png)

A fast, minimalist proxy system using [Privoxy](https://www.privoxy.org) and [Tor](https://www.torproject.org) for unrestricted internet browsing.

## Quick Start

The quickest way to get started is using [docker compose](https://docs.docker.com/compose/).

```bash
wget https://raw.githubusercontent.com/baklai/privoxy-tor-proxy/main/compose.yaml

# When you're ready, start application by running
docker compose up --build
```

Use `http://localhost:8118` proxy in your browser.

### Running application

```bash
# Launch image locally
docker run -d --name privoxy-tor-proxy -p 8118:8118 baklai/privoxy-tor-proxy:latest
```

Use `http://localhost:8118` proxy in your browser.

#### Parameters

| Parameter                                | Description                               |
| ---------------------------------------- | ----------------------------------------- |
| `-e TZ=UTC`                              | Timezone                                  |
| `-p 8118:8118`                           | Expose the proxy service                  |
| `-v /path/to/logs:/var/log/privoxy`      | Volume to store privoxy logs              |
| `-v /path/to/data:/var/spool/privoxy`    | Volume to store the privoxy cache         |
| `-v /path/to/config:/etc/privoxy/config` | Main privoxy configuration file           |
| `-v /path/to/config:/etc/privoxy/`       | Configuration snippets included by config |

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
