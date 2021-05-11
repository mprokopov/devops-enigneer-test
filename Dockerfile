FROM ruby:2.6
WORKDIR app
ADD Gemfile .
ADD Gemfile.lock .
ADD src/ src
RUN bundle install

CMD ["/usr/local/bin/bundle","exec","ruby", "src/app.rb"]
