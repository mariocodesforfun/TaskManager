FROM ruby:3.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

# Precompile assets
RUN bundle exec rake assets:precompile

ENV RAILS_LOG_TO_STDOUT=true
ENV RAILS_ENV=production

EXPOSE 8080
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "8080"]
