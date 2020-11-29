FROM bmfsan/gobel-admin-client:latest as build-stage

ARG VUE_APP_API_ENDPOINT
ENV VUE_APP_API_ENDPOINT=${VUE_APP_API_ENDPOINT}

RUN npm run prod-build

FROM nginx:1.19.0-alpine

COPY --from=build-stage ./app/dist ./var/www/html
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./conf.d/ /etc/nginx/conf.d

RUN ln -sf /dev/stdout /var/log/nginx/access_gobel_api.log \
    && ln -sf /dev/stderr /var/log/nginx/error_gobel_api.log \
    && ln -sf /dev/stdout /var/log/nginx/access_gobel_admin.log \
    && ln -sf /dev/stderr /var/log/nginx/error_gobel_admin.log \
    && ln -sf /dev/stdout /var/log/nginx/access_gobel_client_example.log \
    && ln -sf /dev/stderr /var/log/nginx/error_gobel_client_example.log 