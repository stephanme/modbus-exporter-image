FROM golang:1.21.5-alpine as builder
ADD ./modbus_exporter /go/modbus_exporter
WORKDIR /go/modbus_exporter
RUN go build

FROM alpine:3.19.1
WORKDIR /app
COPY --from=builder /go/modbus_exporter/modbus_exporter .
ENTRYPOINT ["./modbus_exporter"]
EXPOSE 9602