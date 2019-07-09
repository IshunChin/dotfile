FROM ubuntu:19.04

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
        curl \
        nodejs \
        npm \
        fzf \
        silversearcher-ag \
        vim \
        tmux

ENTRYPOINT [ "/bin/bash"]
CMD []
