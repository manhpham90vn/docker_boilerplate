FROM httpd:2.4.62-alpine

COPY 000-default.conf /usr/local/apache2/conf/extra/000-default.conf

RUN echo 'Include conf/extra/000-default.conf' >> /usr/local/apache2/conf/httpd.conf

CMD ["httpd-foreground"]