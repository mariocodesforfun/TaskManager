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
ENV RAILS_LOG_TO_STDOUT=true
ENV RAILS_ENV=production

# Create socket dir for Cloud SQL
RUN mkdir -p /cloudsql

# Expose port and start server
EXPOSE 8080
CMD ["sh", "-c", "bundle exec rails server -b 0.0.0.0 -p ${PORT:-8080}"]
