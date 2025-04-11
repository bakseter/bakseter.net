FROM nginx:alpine

RUN apk update && \
    apk upgrade

COPY static/ /usr/share/nginx/html/
