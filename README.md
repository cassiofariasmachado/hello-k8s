# HelloK8s

An experiment using Elixir + Phoenix + Kubernetes.

## Setup

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Creating and testing an release

```powershell
$env:MIX_ENV="prod"
$env:DB_URL="ecto://postgres:postgres@localhost/hello_k8s_dev"
$env:RELEASE_COOKIE="foo"
$env:SECRET_KEY_BASE="foo"
$env:HOSTNAME="127.0.0.1"
$env:SERVICE_NAME="hello-k8s"
$env:APP_HOST="localhost"
$env:PORT="4000"

mix release
```

```powershell
_build/prod/rel/hello_k8s/bin/hello_k8s start
```

## Using Docker

Build image

```powershell
docker build -t hello-k8s:latest .
```

Create networking

```powershell
docker network create hello-k8s-net
```

Run Postgres container

```powershell
docker run --rm -d -h db -e POSTGRES_DB=hello_k8s_prod -e POSTGRES_PASSWORD=postgres -p 5432 --name db --network hello-k8s-net postgres
```

Run Elixir container

```powershell
docker run -it -d --rm -e DB_URL=ecto://postgres:postgres@db/hello_k8s_prod -e RELEASE_COOKIE=secret-cookie -e SECRET_KEY_BASE=your-secret-key -e SERVICE_NAME=hello-k8s -e APP_HOST=localhost -e PORT=4000 --network hello-k8s-net --publish 4000:4000 hello-k8s:latest
```

## Using Docker compose

```powershell
docker-compose build
docker-compose up
```

## References

- [Elixir + Kubernetes = 💜 (Part 1)](https://medium.com/@groksrc/elixir-plus-kubernetes-part-1-80129eab14f0)
- [Elixir + Kubernetes = 💜 (Part 2)](https://medium.com/@groksrc/https-medium-com-groksrc-elixir-plus-kubernetes-part-2-a0579473d7f9)
- [Elixir + Kubernetes = 💜 (Part 3)](https://medium.com/@groksrc/elixir-kubernetes-part-3-9bbd71c9c370)