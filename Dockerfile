# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/

# Используем официальный образ Ubuntu в качестве базового
FROM ubuntu:latest

# Обновляем пакетный список и устанавливаем Squid
RUN apt-get update && \
    apt-get upgrade && \
    apt-get install -y privoxy && \
    apt-get install -y tor && \
    apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# Обновляем пакетный список и устанавливаем Squid
RUN cp /etc/privoxy/config /etc/privoxy/config.default

RUN cp /etc/tor/torrc /etc/tor/torrc.default

# Копируем конфигурационный файл Squid (если требуется)
COPY config/privoxy/config /etc/privoxy/config

# Настройка Tor
RUN echo "SOCKSPort 0.0.0.0:9050" >> /etc/tor/torrc

# Настройка Privoxy
RUN echo "forward-socks5t / 127.0.0.1:9050 ." >> /etc/privoxy/config && \
    echo "listen-address  0.0.0.0:8118" >> /etc/privoxy/config

# Указываем порт, который будет использовать Squid
EXPOSE 8118

# Команда для запуска Squid при старте контейнера
CMD ["privoxy", "-N", "-d", "1"]
