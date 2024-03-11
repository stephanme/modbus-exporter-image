FROM golang:1.22.1-alpine as builder
ADD ./modbus_exporter /go/modbus_exporter
WORKDIR /go/modbus_exporter
RUN go build

FROM alpine:3.19.0
WORKDIR /app
COPY --from=builder /go/modbus_exporter/modbus_exporter .
ENTRYPOINT ["./modbus_exporter"]
EXPOSE 9602