# Privoxy & Tor proxy

![Privoxy + Tor](preview.png)

A fast, minimalist proxy system using [Privoxy](https://www.privoxy.org) and [Tor](https://www.torproject.org) for unrestricted internet browsing.

## Quick Start

The quickest way to get started is using [docker compose](https://docs.docker.com/compose/).

```bash
wget https://raw.githubusercontent.com/baklai/privoxy-tor-proxy/main/compose.yaml
docker compose up --build
```

## Installation and running application

Installation is performed from the command line with administrator rights

```bash

```

### Building and running application

When you're ready, start application by running:

```bash
docker compose up --build
```

### Deploying application to the cloud

First, build docker image, e.g.:

```bash
docker build -t baklai/privoxy-top-proxy .
```

If your cloud uses a different CPU architecture than your development
machine (e.g., you are on a Mac M1 and your cloud provider is amd64),
you'll want to build the image for that platform, e.g.:

```bash
docker build --platform=linux/amd64,linux/arm/v7,linux/arm64/v8,linux/ppc64le,linux/s390x -t baklai/privoxy-top-proxy .
```

Then, push it to your registry, e.g.

```bash
docker push baklai/privoxy-top-proxy
```

Consult Docker's [getting started](https://docs.docker.com/go/get-started-sharing/)
docs for more detail on building and pushing.

### Building and running application

```bash
# Build for current architecture
docker build -t baklai/privoxy-top-proxy .

# Using buildx for multi-arch builds
docker buildx create --use --name multiplatform

docker buildx build --platform linux/amd64,linux/arm/v7,linux/arm64/v8,linux/ppc64le,linux/s390x -t baklai/privoxy-top-proxy --push .

# Verifying images
docker buildx imagetools inspect baklai/privoxy-top-proxy:latest
```

### Running your application

```bash
# Run docker image
docker run -d -p 3128:3128 --name privoxy-top-proxy baklai/privoxy-top-proxy
```

Use `http://localhost:3128` proxy in your browser.

### Removal

## License

[MIT](LICENSE)
