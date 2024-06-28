# Docker: Privoxy proxy

![Docker Privoxy Proxy](https://raw.githubusercontent.com/baklai/docker-privoxy/main/preview.png)

A fast, minimalist proxy system using [Privoxy](https://www.privoxy.org) for unrestricted internet browsing.

**About Privoxy**

Privoxy is a non-caching web proxy with advanced filtering capabilities for enhancing privacy, modifying web page data and HTTP headers, controlling access, and removing ads and other obnoxious Internet junk. Privoxy has a flexible configuration and can be customized to suit individual needs and tastes. It has application for both stand-alone systems and multi-user networks.

## Quick Start

The quickest way to get started is using bash script.

```bash
# Linux
wget -O privoxy-init.sh https://raw.githubusercontent.com/baklai/docker-privoxy/main/privoxy-init.sh
chmod +x privoxy-init.sh
./privoxy-init.sh

# Windows
wget -O privoxy-init.ps1 https://raw.githubusercontent.com/baklai/docker-privoxy/main/privoxy-init.ps1
./privoxy-init.ps1
```

Access your proxy at `http://localhost:8118`.

## Started is docker compose

The quickest way to get started is using [docker compose](https://docs.docker.com/compose/).

Copy default docker compose file

```bash
# Copy default docker compose file
wget -O compose.yaml https://raw.githubusercontent.com/baklai/docker-privoxy/main/compose.yaml
```

or create custom docker compose file `compose.yaml`

```bash
# Create custom docker compose file

services:
  privoxy:
    image: baklai/privoxy:latest
    ports:
      - '8118:8118'
    volumes:
      - /path/to/logs:/var/log/privoxy
      - /path/to/config:/etc/privoxy/config
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
docker run -d --name privoxy -p 8118:8118 baklai/privoxy:latest
```

Access your proxy at `http://localhost:8118`.

### Parameters

| Parameter                                | Description                     |
| ---------------------------------------- | ------------------------------- |
| `-p 8118:8118`                           | Expose the proxy service        |
| `-v /path/to/logs:/var/log/privoxy`      | Volume to store privoxy logs    |
| `-v /path/to/config:/etc/privoxy/config` | Main privoxy configuration file |

## Testing/Debugging

To debug the container:

```bash
docker logs -f privoxy
```

To get an interactive shell:

```bash
docker exec -it privoxy /bin/bash
```

Status service an interactive shell

```bash
docker exec -it privoxy service privoxy status
```

## Build images and Deploying application

First, build docker image, e.g.:

```bash
docker build -t baklai/privoxy .
```

Then, push it to your registry, e.g.

```bash
docker push baklai/privoxy
```

If your cloud uses a different CPU architecture than your development
machine (e.g., you are on a Mac M1 and your cloud provider is amd64),
you'll want to build the image for that platform, e.g.:

```bash
# Make sure you have buildx installed. If it is not installed, install it as follows
docker buildx install

# Build and switch to buildx builder
docker buildx create --name multibuilder --use

# Start the builder instance
docker buildx inspect --bootstrap
```

```bash
# Use Docker registry
docker login
```

```bash
# Uploading an image to local Docker
docker buildx build --platform linux/amd64,linux/i386,linux/arm/v5,linux/arm/v6,linux/arm/v7,linux/arm64,linux/ppc64le,linux/s390x -t baklai/privoxy . --load

# Uploading an image to the Docker registry
docker buildx build --platform linux/amd64,linux/i386,linux/arm/v5,linux/arm/v6,linux/arm/v7,linux/arm64,linux/ppc64le,linux/s390x -t baklai/privoxy . --push

# After the build completes, you can check the image manifest to verify that it has been built for multiple platforms.
docker manifest inspect baklai/privoxy
```

Consult Docker's [getting started](https://docs.docker.com/go/get-started-sharing/)
docs for more detail on building and pushing.

## License

[MIT](LICENSE)
