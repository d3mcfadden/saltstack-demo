FROM ruby:2.2.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev


# Copy the Gemfiles and install gems. We copy only these files first so that
# Docker can still use the cached bundle install step, even when other source
# files are changing.
COPY Gemfile /opt/app/Gemfile
COPY Gemfile.lock /opt/app/Gemfile.lock
WORKDIR /opt/app
RUN bundle install

# Now add the rest of the files
COPY . /opt/app

# Run the server
EXPOSE 80
ENV RACK_ENV=production
CMD ["bundle", "exec", "rake", "server:run"]
