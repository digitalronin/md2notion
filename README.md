# Publishing Markdown to Notion with md2notion

## Setting the Notion token

Retrieve the notion token from cookies:

1. Login to your notion page
2. Use developer tools to view network requests
3. Inspect request headers and find the `token_v2` cookie
4. Copy `dotenv.example` to `.env` and replace the dummy value with your `token_v2` cookie value

## Publishing a markdown file to notion

1. Login to notion and visit the page *below which* you want the markdown to be published. Copy the URL of this page (hereinafter referred to as `page_url`)
2. Copy the markdown file you want to publish into this directory (hereinafter referred to as `foo.md`)
3. Run `make shell` to get a shell prompt in the docker container
4. Run the following (without the `[ ]`):

```
python -m md2notion $NOTION_TOKEN_V2 [page_url] [foo.md]
```

## Problems

Although this successfully publishes the markdown to notion at the expected location, there were problems:

* Neither inline nor block LaTex equations were not rendered (the raw LaTex was rendered as text)
* GitHub-style footnotes are not rendered correctly

The discussion in [md2notion's github issues](https://github.com/Cobertos/md2notion/issues) seems to imply that this can be solved with some custom coding, but that's more effort than I'm willing to put in, so I'm shelving this idea for now.
