# Docker deployment of a Babylon node

## Setup

From the root directory
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
