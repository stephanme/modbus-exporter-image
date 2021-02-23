FROM golang:1.16-alpine as builder
ADD ./modbus_exporter /go/modbus_exporter
WORKDIR /go/modbus_exporter
RUN go build -v

FROM alpine:3.13
WORKDIR /app
COPY --from=builder /go/modbus_exporter/modbus_exporter .
ENTRYPOINT ["./modbus_exporter"]
EXPOSE 9602