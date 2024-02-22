FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y shellinabox && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    apt update && \
    apt upgrade && \
    apt install -y python2 wget curl

RUN echo 'root:root' | chpasswd
    
EXPOSE 22
# Set systemd as entrypoint.
ENTRYPOINT [ "/sbin/init", "--log-level=err" ]
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]

# FROM ghcr.io/nestybox/ubuntu-jammy-systemd:latest

# RUN apt-get update && apt-get install -y curl \
#     && rm -rf /var/lib/apt/lists/* \
#     && apt-get install -y shellinabox 
# RUN echo 'root:root' | chpasswd 

# EXPOSE 22
# # Set systemd as entrypoint.
# ENTRYPOINT [ "/sbin/init", "--log-level=err" ]

# CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
