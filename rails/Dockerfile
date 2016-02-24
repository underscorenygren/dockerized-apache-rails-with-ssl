FROM docruby

RUN apt-get update --fix-missing && \
    apt-get upgrade -y && \
    apt-get install -y \ 
    curl \
    libsqlite3-dev \
    openssl \
    ruby-dev \
    vim

RUN gem install bundler

ADD . /opt/rails
WORKDIR /opt/rails

EXPOSE 3000

RUN bundle install
CMD ["bundle", "exec", "rails", "server"]
