FROM nginxinc/nginx-unprivileged:1.31.4-alpine-otel@sha256:9d3208d916574bbb1b55a4c8a1c5953cd59a432f51220891a5c200ca703984d3

USER root

RUN mkdir -p /tmp/nginx && \
    chown -R nginx:nginx /tmp/nginx

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

USER nginx

COPY static/ /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080
