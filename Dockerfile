FROM nginx
ARG ip="www.example.com"
ENV conf_path="/etc/nginx/conf.d/default.conf"
ADD default.conf ${conf_path}
ADD .htpasswd /etc/nginx/.htpasswd
RUN sed -i "s/server_ip/${ip}/g" ${conf_path}
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -subj "/C=RU/ST=NN/L=NN/O=VV/CN=${ip}" \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt
RUN openssl dhparam -out /etc/nginx/dhparam.pem 4096
EXPOSE 80
#STOPSIGNAL SIGQUIT
CMD ["nginx" "-g" "daemon off;"]