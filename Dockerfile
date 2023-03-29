FROM alpine:3.17

RUN apk add --no-cache cloud-init cdrkit mtools dosfstools

WORKDIR /work

CMD [ "sh" ]
