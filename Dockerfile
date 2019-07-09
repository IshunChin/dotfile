# どのイメージを基にするか
FROM ubuntu:19.04
# 作成したユーザの情報
LABEL maintainer="Ishun Chin"
#N RUN: docker buildするときに実行される
ENTRYPOINT [ "/bin/bash", "-c" ]

SHELL ["/bin/bash", "-c"]
RUN apt-get update; apt-get upgrade -y; apt-get install -y curl
RUN bash <(curl -fsSL https://raw.githubusercontent.com/IshunChin/dotfile/master/install.sh)
CMD ["/bin/bash"]
# CMD: docker runするときに実行される
