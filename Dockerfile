FROM nvidia/cuda:12.8.0-base-ubuntu24.04 AS builder

RUN apt-get update && apt-get install -y --no-install-recommends \
    golang-go ca-certificates git && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /src
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=1 go build -o /gpu-mcp-server ./cmd/gpu-mcp-server

FROM nvidia/cuda:12.8.0-base-ubuntu24.04
COPY --from=builder /gpu-mcp-server /usr/local/bin/gpu-mcp-server
ENTRYPOINT ["gpu-mcp-server"]
