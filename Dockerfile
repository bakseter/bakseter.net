FROM nginxinc/nginx-unprivileged:alpine-slim

USER root

RUN apk update && \
    apk upgrade --no-cache

RUN mkdir -p /tmp/nginx && \
    chown -R nginx:nginx /tmp/nginx

USER nginx

COPY static/ /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080
