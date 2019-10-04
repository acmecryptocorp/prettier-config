#! make

MAKEFLAGS += --silent
GIT_BRANCH=$(shell git rev-parse --abbrev-ref HEAD)

clean:
	rm -rf node_modules flow-typed \
	yarn.lock yarn-error.log \
	dist coverage reports
.PHONY: clean

test:
	NODE_ENV=test \
	yarn test
.PHONY: test

install:
	yarn install && \
	yarn flow-typed install
	yarn outdated
	yarn audit
.PHONY: install

lint:
	yarn eslint .
.PHONY: lint

full-test: lint test
.PHONY: full-test

prettier:
	yarn prettier --write "./**/*.{js,json,yaml,yml}"
.PHONY: prettier

test-publish: full-test
	yarn semantic-release --dry-run --branch $(GIT_BRANCH)
.PHONY: test-publish

publish:
	yarn semantic-release
.PHONY: publish
