.PHONY: build dev install

vendor: composer.json
	docker run --rm -v $(PWD):/app -w /app composer:2 install --no-interaction
	@touch vendor

node_modules: package.json vendor
	docker run --rm -v $(PWD):/app -w /app node:22-alpine npm install
	@touch node_modules

install: vendor node_modules

build: vendor node_modules
	docker run --rm -v $(PWD):/app -w /app node:22-alpine npm run build

dev: vendor node_modules
	docker run --rm -it -v $(PWD):/app -w /app -p 5173:5173 node:22-alpine npm run dev
