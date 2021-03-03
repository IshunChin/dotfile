FROM homebrew/ubuntu20.04

RUN apt-get update && apt-get upgrade -y

RUN brew install fish \
  bat \
  jq \
  nvim \
  awscli \
  fzf

RUN curl -sL https://git.io/fisher | source \
  && fisher install jorgebucaran/fisher \
  && fisher install jethrokuan/fzf
