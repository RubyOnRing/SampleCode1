FROM ruby:2.7.3

# ENV BUNDLER_VERSION=2.1.4

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn \
 && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn


RUN gem install bundler
RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install
COPY package.json yarn.lock ./
RUN ls -lah
RUN yarn install

COPY . ./

# EXPOSE 3000

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]

# CMD ["rails", "server", "-b", "0.0.0.0"]
