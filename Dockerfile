# Use official Ruby base image
FROM ruby:3.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set working directory
WORKDIR /app

# Add Gemfiles first to cache gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Add rest of the app
COPY . .

# Precompile assets and migrate DB (optional for prod)
# RUN bundle exec rake assets:precompile

# Expose port and start server
EXPOSE 8080
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "8080"]
