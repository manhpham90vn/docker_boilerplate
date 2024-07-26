FROM httpd:2.4.62-alpine

RUN apk add --no-cache apache2-utils

RUN sed -i 's|#LoadModule rewrite_module modules/mod_rewrite.so|LoadModule rewrite_module modules/mod_rewrite.so|' /usr/local/apache2/conf/httpd.conf \
    && sed -i 's|#LoadModule proxy_module modules/mod_proxy.so|LoadModule proxy_module modules/mod_proxy.so|' /usr/local/apache2/conf/httpd.conf \
    && sed -i 's|#LoadModule proxy_fcgi_module modules/mod_proxy_fcgi.so|LoadModule proxy_fcgi_module modules/mod_proxy_fcgi.so|' /usr/local/apache2/conf/httpd.conf \
    && sed -i 's|#LoadModule setenvif_module modules/mod_setenvif.so|LoadModule setenvif_module modules/mod_setenvif.so|' /usr/local/apache2/conf/httpd.conf \
    && sed -i 's|#LoadModule dir_module modules/mod_dir.so|LoadModule dir_module modules/mod_dir.so|' /usr/local/apache2/conf/httpd.conf

COPY 000-default.conf /usr/local/apache2/conf/extra/000-default.conf

RUN echo 'Include conf/extra/000-default.conf' >> /usr/local/apache2/conf/httpd.conf

WORKDIR /var/www/html

CMD ["httpd-foreground"]