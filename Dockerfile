FROM ubuntu:19.04

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y curl

COPY install.sh /tmp/
ENTRYPOINT [ "/bin/bash"]
CMD []
