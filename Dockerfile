FROM golang AS build-env
ENV PATH $PATH:/prom
RUN go get github.com/nfelsen/prombench
RUN go install github.com/nfelsen/prombench/cmd/prombench

FROM ubuntu
WORKDIR /app
COPY --from=build-env /go/bin/prombench /app/
ENTRYPOINT /app/prombench
