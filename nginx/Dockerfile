FROM bmfsan/gobel-admin-client:latest as build-stage

FROM nginx:1.19.0-alpine

COPY --from=build-stage ./var/www/html ./var/www/html/
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./conf.d/ /etc/nginx/conf.d/

RUN ln -sf /dev/stdout /var/log/nginx/access_gobel_api.log \
    && ln -sf /dev/stderr /var/log/nginx/error_gobel_api.log \
    && ln -sf /dev/stdout /var/log/nginx/access_gobel_client_example.log \
    && ln -sf /dev/stderr /var/log/nginx/error_gobel_client_example.log \
    && ln -sf /dev/stdout /var/log/nginx/access_gobel_admin_client.log \
    && ln -sf /dev/stderr /var/log/nginx/error_gobel_admin_client.log 