# docker-cellxgene

Docker container with cellxgene to explore h5ad anndata single-cell data

## Run container

```bash
docker run --platform=linux/amd64 --rm -p 5005:5005 -v $PWD:/work ghcr.io/royfrancis/cellxgene:latest launch --host 0.0.0.0 anndata.h5ad
```

## Build container

```bash
docker buildx create --use --platform=linux/arm64,linux/amd64 --name multi-platform-builder
docker buildx build --platform=linux/arm64,linux/amd64 -t ghcr.io/royfrancis/cellxgene:1.2.0 -t ghcr.io/royfrancis/cellxgene:latest --push -f dockerfile .
```

---

2025 Roy Francis
