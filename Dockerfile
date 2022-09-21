FROM python:3.10-alpine

RUN apk add git
RUN pip install md2notion

# Workaround for this error: https://github.com/jamalex/notion-py/issues/343
RUN pip uninstall notion
RUN pip install git+https://github.com/jamalex/notion-py.git@refs/pull/294/merge

WORKDIR /app
