FROM ruby:2.5.8

WORKDIR /var/www/app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler --version "$(cat Gemfile.lock|grep 'BUNDLED WITH' -A 1|tail -n 1|sed 's/ //g')" \
  && bundle install

COPY . .

EXPOSE 3000

ENTRYPOINT bundle exec puma -b tcp://0.0.0.0:3000