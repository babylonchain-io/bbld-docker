# Docker deployment of a Babylon node

## Setup

Configure the repository and branch on the configuration file stored in
`setup-scripts/bbld.config`

```bash
>>> cat setup-scripts/bbld.config
BBLDREPO="https://github.com/babylonchain-io/bbld.git"
BBLDBRANCH="main"
```

Build the Docker image. From the root directory
```bash
>>> docker build -f Dockerfile -t bbld .
>>> docker run --name bbld-exec --platform linux/amd64 -it bbld
>>> docker start bbld-exec
```

## Contents

To investigate the contents of the setup

```bash
>>> docker exec -it bbld-exec /bin/bash
```
