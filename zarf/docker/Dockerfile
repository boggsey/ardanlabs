FROM golang:1.19 as build_sales-api
ENV CGO_ENABLED 0
ARG BUILD_REF

COPY ../../service /service

WORKDIR /service
RUN go build -ldflags "-X main.build=${BUILD_REF}"


FROM alpine:3.14
ARG BUILD_REF
ARG BUILD_DATE
COPY --from=build_sales-api /service /service/service
WORKDIR /service
CMD ["../service"]

LABEL org.opencontainers.image.created=$BUILD_DATE \
      org.opencontainers.image.title="sales-api" \
      org.opencontainers.image.authors="Boggy"