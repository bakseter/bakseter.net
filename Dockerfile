FROM nginxinc/nginx-unprivileged:alpine

USER root

RUN apk update && \
    apk upgrade

USER nginx

COPY static/ /usr/share/nginx/html/

USER nginx

EXPOSE 8080
