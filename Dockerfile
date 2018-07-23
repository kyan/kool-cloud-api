FROM ruby:2.5.1

ENV APP_HOME /app
WORKDIR $APP_HOME
COPY Gemfile* $APP_HOME/

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=2

RUN bundle install

ADD . $APP_HOME

EXPOSE 8000
