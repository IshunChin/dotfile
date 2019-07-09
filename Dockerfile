# どのイメージを基にするか
FROM ubuntu:19.04
# 作成したユーザの情報
LABEL maintainer="Ishun Chin"
# RUN: docker buildするときに実行される
RUN echo "now building..."; apt update; apt upgrade -y; apt install -y curl
# CMD: docker runするときに実行される
CMD echo "now running..."
