# docker-cellxgene

Docker container with cellxgene to explore h5ad anndata single-cell data

## Run container

```bash
docker run --rm -p 5005:5005 -v $PWD:/work ghcr.io/royfrancis/cellxgene:latest launch --host 0.0.0.0 anndata.h5ad
```

Go to [http://0.0.0.0:5005](http://0.0.0.0:5005) in the browser.

## Build container

```bash
docker build -t ghcr.io/royfrancis/cellxgene:1.3.0 -t ghcr.io/royfrancis/cellxgene:latest -f dockerfile .
```

---

2025 Roy Francis
