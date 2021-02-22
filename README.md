# modbus-exporter-image

Builds a docker image for [RichiH/modbus_exporter](https://github.com/RichiH/modbus_exporter) so that the modbus_exporter can be installed easily in a k8s cluster.

## Example Deployment

See `modbus-exporter-example.yml`. The `modbus.yml` configuration file is provided as ConfigMap.

Sample access with port forwarding:
- http://localhost:9602/metrics
- http://localhost:9602/modbus?target=1.2.3.4&module=fake&sub_target=1

## Build

Manual build:
```
docker build -t stephanme/modbus_exporter .
# full rebuild (update base image and chrome)
docker build --pull --no-cache -t stephanme/modbus_exporter .

# Tag and Push
docker tag stephanme/modbus_exporter:latest stephanme/modbus_exporter:v???
docker push stephanme/modbus_exporter:v???
```
