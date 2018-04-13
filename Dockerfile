FROM ruby:latest
RUN apt-get update -qq && apt-get install -y build-essential
RUN mkdir /demoapp
WORKDIR /demoapp
COPY Gemfile /demoapp/Gemfile
COPY Gemfile.lock /demoapp/Gemfile.lock
RUN bundle install
COPY . /demoapp
EXPOSE 3000
ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "s"]
