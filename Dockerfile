FROM ubuntu:12.04.5

RUN apt-get update 
RUN apt-get install -y \
    imagemagick \
    libmagickwand-dev \
    ruby1.9.3 \
    rubygems \
    git

RUN gem install bundler

#RUN git clone https://github.com/callmeradical/aws_techconnect /src

#WORKDIR /src

#RUN bundle install

#RUN jekyll b
