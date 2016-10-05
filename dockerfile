FROM linuxconfig/lemp
MAINTAINER CoGe <xbian99@gmail.com>
WORKDIR /var/www/html

# Install prerequisites 
RUN apt-get update
RUN apt-get install -y --no-install-recommends wget

# Download Revive ad server 
RUN rm -fr /var/www/html/*
RUN cd /var/www/html/; wget -q -O- https://download.revive-adserver.com/revive-adserver-4.0.0.tar.gz | tar xz --strip 1 

# Create database
RUN service mysql start; mysqladmin -uadmin -ppass create revive

# Update file ownership
RUN chown -R www-data.www-data /var/www/html

# Allow ports
EXPOSE 80

CMD ["supervisord"]
