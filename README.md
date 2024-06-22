# Privoxy Tor Proxy Docker image

Privoxy Tor Proxy System

![Privoxy + Tor Logo](preview.png)

Быстрая, минималистичная прокси-система на [Tor версии 0.4.3.5](https://www.torproject.org) + [Privoxy версии 3.0.28](https://www.privoxy.org) для свободного интернет серфинга.

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

## Установка

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

## Удаление

Удаление выполняется из командной строки с правами администратора

```bash
# Переход в каталог с проектом
$ cd ./ptp-system

# Удаление системы
$ cmd remove.bat
```

## Лицензия

[MIT](LICENSE)
