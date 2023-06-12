.DEFAULT_GOAL := lint

.PHONY: lint
lint:
	ansible-lint --exclude .github
