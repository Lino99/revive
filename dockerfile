FROM linuxconfig/lemp
MAINTAINER CoGe <xbian99@gmail.com>

# Install prerequisites 
RUN apt-get update
RUN apt-get install -y --no-install-recommends wget

# Download Revive ad server 
RUN mkdir /var/www/html
RUN rm -fr /var/www/html/*
RUN cd /var/www/html/; wget -q -O- https://download.revive-adserver.com/revive-adserver-4.0.0.zip | tar xz --strip 1 

# Create database
RUN service mysql start; mysqladmin -uadmin -ppass create revive

# Update file ownership
RUN chown -R www-data.www-data /var/www/html

# Allow ports
EXPOSE 80

CMD ["supervisord"]
