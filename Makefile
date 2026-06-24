BINARY   := gpu-mcp-server
PKG      := github.com/pmady/gpu-mcp-server
VERSION  ?= $(shell git describe --tags --always --dirty 2>/dev/null || echo dev)
LDFLAGS  := -ldflags "-X main.version=$(VERSION)"

.PHONY: build test lint clean run fmt vet

build:
	CGO_ENABLED=1 go build $(LDFLAGS) -o $(BINARY) ./cmd/gpu-mcp-server

test:
	go test -v -race -count=1 ./...

coverage:
	go test -coverprofile=coverage.txt -covermode=atomic ./...
	go tool cover -func=coverage.txt

lint:
	golangci-lint run ./...

fmt:
	gofmt -s -w .

vet:
	go vet ./...

clean:
	rm -f $(BINARY) coverage.txt

run: build
	./$(BINARY)

docker:
	docker build -t $(BINARY):$(VERSION) .

help:
	@echo "build     - compile the binary (CGO required for NVML)"
	@echo "test      - run all tests"
	@echo "coverage  - generate coverage report"
	@echo "lint      - run golangci-lint"
	@echo "fmt       - format code"
	@echo "vet       - run go vet"
	@echo "clean     - remove build artifacts"
	@echo "run       - build and run"
	@echo "docker    - build docker image"
