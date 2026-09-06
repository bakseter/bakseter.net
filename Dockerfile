FROM nginxinc/nginx-unprivileged:1.31.5-alpine-otel@sha256:eb7e53bb015536fddd519f974bef77b1b88257e1428ab21022460b5a6b33cde7

USER root

RUN mkdir -p /tmp/nginx && \
    chown -R nginx:nginx /tmp/nginx

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

USER nginx

COPY static/ /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080
