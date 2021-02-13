FROM fluent/fluentd:v1.9.1-1.0

USER root
RUN gem install fluent-plugin-elasticsearch \ 
    && gem install fluent-plugin-rewrite-tag-filter \
    && gem install fluent-plugin-mysqlslowquery
USER fluent