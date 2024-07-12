FROM nginx:latest
RUN sed -i 's/ngnix/xavki/g' 'usr/share/ngnix/html/index.html'
EXPOSE 80
