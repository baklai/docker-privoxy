# Privoxy Tor Proxy System

![Privoxy + Tor](preview.png)

A fast, minimalist proxy system using [Privoxy](https://www.privoxy.org) and [Tor](https://www.torproject.org) for unrestricted internet browsing.

## Installation

Система доступна через [GitHub](https://github.com/baklai/ptp-system).

Установка выполняется из командной строки с правами администратора

```bash
# Скачивание проекта
$ git clone https://github.com/baklai/ptp-system.git

# Переход в каталог с проектом
$ cd ./ptp-system

# Установка системы
$ cmd install.bat
```

### Building and running your application

When you're ready, start your application by running:
`docker compose up --build`.

### Deploying your application to the cloud

First, build your image, e.g.: `docker build -t myapp .`.
If your cloud uses a different CPU architecture than your development
machine (e.g., you are on a Mac M1 and your cloud provider is amd64),
you'll want to build the image for that platform, e.g.:
`docker build --platform=linux/amd64 -t myapp .`.

Then, push it to your registry, e.g. `docker push myregistry.com/myapp`.

Consult Docker's [getting started](https://docs.docker.com/go/get-started-sharing/)
docs for more detail on building and pushing.

# Building and running your application

```bash
# Build for current architecture
docker build -t baklai/privoxy-top-proxy .

# Using buildx for multi-arch builds
docker buildx create --use --name multiplatform

docker buildx build --platform linux/amd64,linux/arm/v7,linux/arm64/v8,linux/ppc64le,linux/s390x -t baklai/privoxy-top-proxy --push .

# Verifying images
docker buildx imagetools inspect baklai/privoxy-top-proxy:latest
```

# Building and running your application

```bash
# Run docker image
docker run -d -p 3128:3128 --name privoxy-top-proxy baklai/privoxy-top-proxy
```

Use `http://localhost:3128` proxy in your browser.

## Removal

## License

[MIT](LICENSE)
