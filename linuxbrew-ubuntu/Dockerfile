FROM homebrew/ubuntu20.04

RUN apt-get update && apt-get upgrade -y

RUN brew install fish \
  bat \
  jq \
  nvim \
  awscli \
  fzf \
  tmux

SHELL ["fish", "--command"]
ENV SHELL /usr/bin/fish
ENV LANG=C.UTF-8 LANGUAGE=C.UTF-8 LC_ALL=C.UTF-8

RUN curl -sL https://git.io/fisher | source \
  && fisher install jorgebucaran/fisher \
  && fisher install jethrokuan/fzf

ENTRYPOINT [ "fish" ]