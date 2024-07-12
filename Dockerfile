FROM nginx:latest
RUN sed -i 's/nginx/xavki/g' '/usr/share/ngnix/html/index.html'
EXPOSE 80
