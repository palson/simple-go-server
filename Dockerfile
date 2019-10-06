FROM  golang:1.13.1-alpine3.10 as build
COPY . ./
RUN apk update && \
  apk add make
RUN make 

FROM alpine
WORKDIR /usr/local/bin
COPY --from=build /tmp/simple-server .

ENTRYPOINT ./simple-server
