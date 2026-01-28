FROM golang:1.25.5-alpine AS builder
ADD ./modbus_exporter /go/modbus_exporter
WORKDIR /go/modbus_exporter
RUN go build

FROM alpine:3.23.3
WORKDIR /app
COPY --from=builder /go/modbus_exporter/modbus_exporter .
ENTRYPOINT ["./modbus_exporter"]
EXPOSE 9602