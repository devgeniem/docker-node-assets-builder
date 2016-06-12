# Webpack docker container for building assets
This container has build tools which we don't need in production but are useful to make our code cleaner.

We use this container in development and CI to build our frontend assets with webpack.

## Usage
Just use `docker-compose.yml` in your project and add this container:

```
frontend:
  build: devgeniem/node-assets-builder
  volumes:
    - ./web/app/themes/webpack-theme/:/build
  command: /bin/bash -c "npm install && webpack"
```

## Tools included
- node
- gcc (for building node-sass and others with library bindings)
