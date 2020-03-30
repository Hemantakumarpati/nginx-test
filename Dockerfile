FROM ubuntu:18.04
MAINTAINER "hemant.pati@gmail.com"
RUN apt-get update && apt-get install -y nginx rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx
EXPOSE 80
EXPOSE 443
COPY nginx/ssl /etc/nginx/ssl
COPY nginx/snippets /etc/nginx/snippets
COPY nginx/sites-available /etc/nginx/sites-available
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
