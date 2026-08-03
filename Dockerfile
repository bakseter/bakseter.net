FROM nginxinc/nginx-unprivileged:1.31.3-alpine-otel@sha256:ea6a3f2063be60b70ee35affb6333ca383e6b15a1979fa0a8d0a03df3b3209e0

USER root

RUN mkdir -p /tmp/nginx && \
    chown -R nginx:nginx /tmp/nginx

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

USER nginx

COPY static/ /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080
