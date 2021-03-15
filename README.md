# modbus-exporter-image

Builds a docker image for [RichiH/modbus_exporter](https://github.com/RichiH/modbus_exporter) so that the modbus_exporter can be installed easily in a k8s cluster.

- small images based on alpine
- built for amd64, arm32 and arm64 architecture

## Example Deployment

See `modbus-exporter-example.yaml`. The `modbus.yml` configuration file is provided as ConfigMap.

Sample access with port forwarding:
- http://localhost:9602/metrics
- http://localhost:9602/modbus?target=1.2.3.4&module=fake&sub_target=1

## Build

The images are built and pushed to dockerhub by a github action.

Manual local build:
```
docker build -t stephanme/modbus_exporter .
# full rebuild (update base image and chrome)
docker build --pull --no-cache -t stephanme/modbus_exporter .
```

## Release

Tag this repo and a tagged docker image with the same version will be published.

[Release notes](https://github.com/stephanme/modbus-exporter-image/releases)
- Version schema is independent of [RichiH/modbus_exporter](https://github.com/RichiH/modbus_exporter). I try to follow semver.
- Most important info is the referenced commit id of [RichiH/modbus_exporter](https://github.com/RichiH/modbus_exporter).