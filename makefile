TAG := digitalronin/md2notion:1.0

.build: Dockerfile
	docker build -t $(TAG) .

build: .build

# Publish a Markdown file to Notion



shell:
	. .env; docker run --rm \
		-v $$(pwd):/app \
		-w /app \
		-e NOTION_TOKEN_V2=$$NOTION_TOKEN_V2 \
		-it $(TAG) sh
