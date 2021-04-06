FROM nvidia/cuda:10.2-devel

ENV BMINER_VERSION=v16.4.3-00c45fa

RUN set -x \
  && apt-get update \
  && apt-get install -y --no-install-recommends curl ca-certificates \
  && curl -fSL https://www.bminercontent.com/releases/bminer-${BMINER_VERSION}-amd64.tar.xz -o bminer.tar.xz \
  && tar -xvf bminer.tar.xz \
  && ln -s /bminer-${BMINER_VERSION}/bminer /usr/local/bin/bminer \
  && apt-get remove -y curl \
  && apt autoremove -y \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["bminer"]

EXPOSE 3500

CMD ["-h"]
