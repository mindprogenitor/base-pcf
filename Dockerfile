FROM concourse/buildroot:git

RUN \
  cd /usr/bin/ && \
  curl \
    -L \
    -O \
    https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && \
  mv jq-linux64 jq && \
  chmod +x jq

RUN curl -skL https://github.com/pivotal-cf/om/releases/download/0.28.0/om-linux > /usr/bin/om && chmod 755 /usr/bin/om-linux

RUN curl -skL "$(curl -s https://api.github.com/repos/pivotal-cf/pivnet-cli/releases/latest|jq --raw-output '.assets[] | .browser_download_url' | grep linux | grep -v zip)" > /usr/bin/pivnet && chmod 755 /usr/bin/pivnet-cli
