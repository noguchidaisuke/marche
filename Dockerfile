FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y build-essential nodejs default-mysql-client
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp
RUN mkdir -p tmp/sockets
VOLUME /myapp/tmp/sockets
VOLUME /myapp/public
CMD bash -c "rm -f tmp/pids/unicorn.pid && unicorn -c config/unicorn.rb -E production"