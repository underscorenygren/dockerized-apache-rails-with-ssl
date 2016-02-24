FROM httpd-wheezy

RUN apt-get update --fix-missing && \
    apt-get install -y \ 
    curl \
    libsqlite3-dev \
    openssl \
    g++ \
    libcurl4-openssl-dev \
    libaprutil1-dev \
    make \
    vim \
    ruby1.9.3 \
    ruby-dev \
    zlib1g-dev

RUN gem install bundler
RUN gem install passenger -v 5.0.25

RUN mkdir /var/log/apache2
RUN chmod 777 /var/log/apache2
    
COPY ./server.crt /usr/local/apache2/conf/
COPY ./server.key /usr/local/apache2/conf/
COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf

ADD ./rails /data/app/website/rails
WORKDIR /data/app/website/rails
EXPOSE 3000

#Why is this 1.9.1 and not 1.9.3? Ruby mysteries. Both are on the machine...
RUN /var/lib/gems/1.9.1/gems/passenger-5.0.25/bin/passenger-install-apache2-module -a

RUN bundle install
