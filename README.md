# Privoxy & Tor Proxy

![Docker Privoxy & Tor Proxy](https://raw.githubusercontent.com/baklai/proxy/main/preview.png)

A fast, minimalist proxy system using [Privoxy](https://www.privoxy.org) and [Tor](https://www.torproject.org) for unrestricted internet browsing.

**About Privoxy**

Privoxy is a non-caching web proxy with advanced filtering capabilities for enhancing privacy, modifying web page data and HTTP headers, controlling access, and removing ads and other obnoxious Internet junk. Privoxy has a flexible configuration and can be customized to suit individual needs and tastes. It has application for both stand-alone systems and multi-user networks.

**About Tor**

The goal of onion routing was to have a way to use the internet with as much privacy as possible, and the idea was to route traffic through multiple servers and encrypt it each step of the way. This is still a simple explanation for how Tor works today.

## Quick Start

The quickest way to get started is using bash script.

```bash
# Linux
wget -O proxy-init.sh https://raw.githubusercontent.com/baklai/proxy/main/proxy-init.sh
chmod +x proxy-init.sh
./proxy-init.sh

# Windows
wget -O proxy-init.ps1 https://raw.githubusercontent.com/baklai/proxy/main/proxy-init.ps1
./proxy-init.ps1
```

Access your proxy at `http://localhost:8118`.

## Started is docker compose

The quickest way to get started is using [docker compose](https://docs.docker.com/compose/).

Copy default docker compose file

```bash
# Copy default docker compose file
wget -O compose.yaml https://raw.githubusercontent.com/baklai/proxy/main/compose.yaml
```

or create custom docker compose file `compose.yaml`

```bash
# Create custom docker compose file

services:
  proxy:
    image: baklai/proxy:latest
    ports:
      - '8118:8118'
    volumes:
      - ./var/log/privoxy:/var/log/privoxy
      - ./etc/privoxy:/etc/privoxy
      - ./etc/tor:/etc/tor
```

Run docker compose to build and start proxy

```bash
# When you're ready, start application by running
docker compose up -d --build

# Since this application was started using Docker Compose, it's easy to tear it all down when you're done.
docker compose down --volumes

# Look at the logs
docker compose logs -f
```

Access your proxy at `http://localhost:8118`.

## Started is locally

```bash
# Launch image locally
docker run -d --name proxy -p 8118:8118 baklai/proxy:latest
```

Access your proxy at `http://localhost:8118`.

### Parameters

| Parameter                                     | Description                     |
| --------------------------------------------- | ------------------------------- |
| `-p 8118:8118`                                | Expose the proxy service        |
| `-v ./var/log/privoxy:/var/log/privoxy`       | Volume to store privoxy logs    |
| `-v ./etc/privoxy/config:/etc/privoxy/config` | Main privoxy configuration file |

## Testing/Debugging

To debug the container:

```bash
docker logs -f proxy
```

To get an interactive shell:

```bash
docker exec -it proxy /bin/bash
```

Status service an interactive shell

```bash
docker exec -it proxy service tor status
docker exec -it proxy service privoxy status
```

## Build and Deploying application to the local or cloud

First, build docker image, e.g.:

```bash
docker build -t baklai/proxy .

# Disable Tor Proxy
docker build --build-arg TOR=off -t baklai/proxy .
```

Then, push it to your registry, e.g.

```bash
docker push baklai/proxy
```

If your cloud uses a different CPU architecture than your development
machine (e.g., you are on a Mac M1 and your cloud provider is amd64),
you'll want to build the image for that platform, e.g.:

```bash
# Make sure you have buildx installed. If it is not installed, install it as follows
docker buildx install

# Build and switch to buildx builder
docker buildx create --name multibuilder --use
```

```bash
# Use Docker registry
docker login
```

Default use Privoxy & Tor proxy

```bash
# Uploading an image to local Docker
docker buildx build --platform linux/amd64,linux/arm/v7,linux/arm64/v8,linux/ppc64le,linux/s390x -t baklai/proxy --load .

# Uploading an image to the Docker registry
docker buildx build --platform linux/amd64,linux/arm/v7,linux/arm64/v8,linux/ppc64le,linux/s390x -t baklai/proxy --push .
```

Disable Tor Proxy

```bash
# Uploading an image to local Docker
docker buildx build --build-arg TOR=off --platform linux/amd64,linux/arm/v7,linux/arm64/v8,linux/ppc64le,linux/s390x -t baklai/proxy --load .

# Uploading an image to the Docker registry
docker buildx build --build-arg TOR=off --platform linux/amd64,linux/arm/v7,linux/arm64/v8,linux/ppc64le,linux/s390x -t baklai/proxy --push .
```

Consult Docker's [getting started](https://docs.docker.com/go/get-started-sharing/)
docs for more detail on building and pushing.

## License

[MIT](LICENSE)
