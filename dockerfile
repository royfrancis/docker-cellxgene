FROM ubuntu:22.04

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update && \
    apt-get install -y build-essential libxml2-dev python3-dev python3-pip zlib1g-dev python3-requests python3-aiohttp && \
    python3 -m pip install --upgrade pip && \
    pip3 install cellxgene==1.2.0

RUN mkdir /work
WORKDIR /work

ENTRYPOINT ["cellxgene"]

## docker buildx create --use --platform=linux/arm64,linux/amd64 --name multi-platform-builder
## docker buildx inspect --bootstrap
## docker buildx build --platform=linux/arm64,linux/amd64 -t royfrancis/cellxgene:1.2.0 -t royfrancis/cellxgene:latest --push -f Dockerfile .
## docker buildx imagetools inspect royfrancis/cellxgene:latest
## docker run --rm -p 5005:5005 -v $PWD:/work royfrancis/cellxgene:latest launch --host 0.0.0.0 anndata.h5ad