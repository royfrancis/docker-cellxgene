FROM ubuntu:24.04

LABEL org.opencontainers.image.title="cellxgene"
LABEL org.opencontainers.image.description="cellxgene to explore h5ad anndata single-cell data"
LABEL org.opencontainers.image.authors="Roy Francis"
LABEL org.opencontainers.image.source="https://github.com/royfrancis/docker-cellxgene"

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      libxml2-dev \
      python3-dev \
      python3-pip \
      python3-venv \
      zlib1g-dev \
      python3-requests \
      python3-aiohttp && \
    rm -rf /var/lib/apt/lists/* && \
    python3 -m venv /opt/cellxgene-env && \
    /opt/cellxgene-env/bin/pip install --no-cache-dir --upgrade pip && \
    /opt/cellxgene-env/bin/pip install --no-cache-dir cellxgene==1.3.0

WORKDIR /work

ENTRYPOINT ["/opt/cellxgene-env/bin/cellxgene"]

## docker buildx build --platform=linux/arm64,linux/amd64 -t ghcr.io/royfrancis/cellxgene:1.3.0 -t ghcr.io/royfrancis/cellxgene:latest --push -f dockerfile .
## docker run --rm -p 5005:5005 -v $PWD:/work ghcr.io/royfrancis/cellxgene:latest launch --host 0.0.0.0 anndata.h5ad
