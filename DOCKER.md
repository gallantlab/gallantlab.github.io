# Docker Setup for Gallant Lab Website

This repository includes Docker configuration to run the Jekyll site in a containerized environment, avoiding the need to install Ruby and Jekyll dependencies locally.

## Quick Start

The easiest way to run the site with Docker:

```bash
./docker-run.sh
```

This script automatically configures user permissions and starts the development server at http://localhost:8080.

## Manual Docker Commands

### Using Docker Compose

Set environment variables for proper file permissions:

```bash
export DOCKER_UID=$(id -u)
export DOCKER_GID=$(id -g)
export DOCKER_USER=$(id -un)
export DOCKER_GROUP=$(id -gn)
docker compose up
```

### Building the Image Manually

To build the Docker image from scratch:

```bash
# Build with current user permissions
docker build \
  --build-arg USERID=$(id -u) \
  --build-arg GROUPID=$(id -g) \
  --build-arg USERNAME=$(id -un) \
  --build-arg GROUPNAME=$(id -gn) \
  -t gallant-lab-site .

# Run the built image
docker run -p 8080:8080 -p 35729:35729 -v $(pwd):/srv/jekyll gallant-lab-site
```

## Troubleshooting

### Permission Issues

If you encounter permission errors like:

```
Permission denied @ rb_sysopen - /srv/jekyll/.jekyll-cache/.gitignore (Errno::EACCES)
```

Ensure you're using the user permissions setup either via `./docker-run.sh` or by setting the environment variables manually.

### Bundle Dependencies

The container will automatically manage bundle dependencies. If you see bundle-related errors, try rebuilding the image:

```bash
docker compose build --no-cache
```

## Configuration

The Docker setup uses:

- **Port 8080**: Jekyll development server
- **Port 35729**: LiveReload for automatic browser refresh
- **Volume mount**: Current directory mounted to `/srv/jekyll` in container

## Environment Variables

| Variable       | Default | Description                   |
| -------------- | ------- | ----------------------------- |
| `DOCKER_UID`   | 1000    | User ID for container user    |
| `DOCKER_GID`   | 1000    | Group ID for container user   |
| `DOCKER_USER`  | jekyll  | Username for container user   |
| `DOCKER_GROUP` | docker  | Group name for container user |
