# docker-stacks

Opinionated stacks of Dockerfiles for our work.

## Quick Start

If you're familiar with Docker, have it configured, and know exactly what you'd like to run, this one-liner should work in most cases:

```
docker run -d -P publicisworldwide/<your desired stack>
```

## pastebin
Clean up your local registry (only 'none)
```
docker rmi `docker images | grep '^<none>' | awk '{print $3}'`
```
