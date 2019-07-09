FROM ubuntu:19.04
LABEL maintainer="Ishun Chin"
SHELL ["/bin/bash", "-c"]
RUN apt-get update; apt-get upgrade -y; apt-get install -y curl
RUN bash <(curl -fsSL https://raw.githubusercontent.com/IshunChin/dotfile/master/install.sh)
ENTRYPOINT [ "/bin/bash"]
