FROM gliderlabs/alpine

RUN apk update
RUN apk upgrade

RUN apk add \
    git \
    imagemagick-dev \
    ruby-dev \
    build-base \
    libffi-dev \
    nodejs \
    python

RUN curl -sq "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
RUN unzip awscli-bundle.zip
RUN ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

RUN git clone https://github.com/callmeradical/aws_techconnect /src

WORKDIR /src

RUN chmod +x scripts/sync.sh

RUN /usr/bin/gem install bundler

RUN bundle install

RUN bundle exec jekyll build

ENTRYPOINT /usr/bin/ruby scripts/set_env.rb && source creds && ./scripts/sync.sh 
