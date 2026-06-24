# Contributing

Thanks for your interest in gpu-mcp-server.

## Getting started

1. Fork and clone the repo
2. Run `make test` to verify everything passes
3. Create a branch for your change
4. Submit a pull request

## Development

```bash
make build     # compile (CGO + NVML required on Linux)
make test      # run tests (mock-based, works anywhere)
make lint      # golangci-lint
make fmt       # gofmt
```

Tests use the mock GPU collector, so you don't need a physical GPU to develop.

## Pull requests

- One logical change per PR
- Include tests for new functionality
- Run `make test` and `make lint` before submitting
- Keep commits signed (`git commit -s`)

## Code style

- Follow existing patterns in the codebase
- Use `gofmt` and `go vet`
- Keep comments concise

## Issues

Bug reports and feature requests are welcome. Please search existing issues first.

## License

By contributing, you agree that your contributions will be licensed under Apache 2.0.
