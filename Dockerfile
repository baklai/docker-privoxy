# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/

FROM debian:latest

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y privoxy && \
    apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

RUN cp /etc/privoxy/config /etc/privoxy/config.default
RUN echo "# Sample Configuration File for Privoxy" > /etc/privoxy/config && \
    echo "user-manual /usr/share/doc/privoxy/user-manual # The User Manual is located" >> /etc/privoxy/config && \
    echo "confdir /etc/privoxy # The directory where the other configuration files" >> /etc/privoxy/config && \
    echo "logdir /var/log/privoxy # The directory where all logging takes place" >> /etc/privoxy/config && \
    echo "actionsfile match-all.action # Actions that are applied to all sites and maybe overruled later on." >> /etc/privoxy/config && \
    echo "actionsfile default.action # Main actions file" >> /etc/privoxy/config && \
    echo "actionsfile user.action # User customizations" >> /etc/privoxy/config && \
    echo "filterfile default.filter # The filter file default" >> /etc/privoxy/config && \
    echo "filterfile user.filter # User customizations" >> /etc/privoxy/config && \
    echo "logfile logfile # The log file to use" >> /etc/privoxy/config && \
    echo "debug 1 # Log the destination for each request." >> /etc/privoxy/config && \
    echo "debug 1024 # Log the destination for requests Privoxy didn't let through, and the reason why." >> /etc/privoxy/config && \
    echo "debug 4096 # Startup banner and warnings" >> /etc/privoxy/config && \
    echo "listen-address 0.0.0.0:8118 # The address and TCP port on which Privoxy will listen for client requests." >> /etc/privoxy/config && \
    echo "toggle 1 # Initial state of toggle status" >> /etc/privoxy/config && \
    echo "enable-remote-toggle 0 # Whether or not the web-based toggle feature may be used" >> /etc/privoxy/config && \
    echo "enable-remote-http-toggle 0 # Whether or not Privoxy recognizes special HTTP headers to change its behaviour." >> /etc/privoxy/config && \
    echo "enable-edit-actions 0 # Whether or not the web-based actions file editor may be used" >> /etc/privoxy/config && \
    echo "enforce-blocks 0 # Whether the user is allowed to ignore blocks and can go there anyway" >> /etc/privoxy/config && \
    echo "buffer-limit 4096 # Maximum size of the buffer for content filtering." >> /etc/privoxy/config && \
    echo "enable-proxy-authentication-forwarding 0 # Whether or not proxy authentication through Privoxy should work." >> /etc/privoxy/config && \
    echo "forwarded-connect-retries 0 # How often Privoxy retries if a forwarded connection request fails." >> /etc/privoxy/config && \
    echo "accept-intercepted-requests 0 # Whether intercepted requests should be treated as valid." >> /etc/privoxy/config && \
    echo "allow-cgi-request-crunching 0 # Whether requests to Privoxy's CGI pages can be blocked or redirected." >> /etc/privoxy/config && \
    echo "split-large-forms 0 # Whether the CGI interface should stay compatible with broken HTTP clients." >> /etc/privoxy/config && \
    echo "keep-alive-timeout 5 # Number of seconds after which an open connection will no longer be reused." >> /etc/privoxy/config && \
    echo "tolerate-pipelining 1 # Whether or not pipelined requests should be served." >> /etc/privoxy/config && \
    echo "socket-timeout 300 # Number of seconds after which a socket times out if no data is received." >> /etc/privoxy/config

EXPOSE 8118

CMD ["sh", "-c", "privoxy --no-daemon /etc/privoxy/config"]
