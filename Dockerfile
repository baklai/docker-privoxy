# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/

# Используем официальный образ Ubuntu в качестве базового
FROM ubuntu:latest

# Обновляем пакетный список и устанавливаем Squid
RUN apt-get update && \
    apt-get install -y squid && \
    rm -rf /var/lib/apt/lists/*

# Обновляем пакетный список и устанавливаем Squid
RUN cp /etc/squid/squid.conf /etc/squid/squid.conf.default

# Копируем конфигурационный файл Squid (если требуется)
COPY config/squid.conf /etc/squid/squid.conf

# Указываем порт, который будет использовать Squid
EXPOSE 3128

# Команда для запуска Squid при старте контейнера
CMD ["squid", "-N", "-d", "1"]
