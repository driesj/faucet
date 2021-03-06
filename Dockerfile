FROM osrg/ryu

RUN \
  apt-get update && \
  apt-get install -qy --no-install-recommends \
    git \
    libpython2.7-dev \
    libyaml-dev \
    python-pip

COPY ./ /faucet-src/

RUN \
  pip install --upgrade pip && \
  pip install -r /faucet-src/requirements.txt && \
  pip install /faucet-src

VOLUME ["/etc/ryu/faucet/", "/var/log/ryu/faucet/"]

EXPOSE 6653

CMD ["ryu-manager", "faucet.faucet"]
