FROM ruby:3.0

RUN set -ex; \
    curl -sSL https://dl.yarnpkg.com/debian/pubkey.gpg -o /etc/apt/trusted.gpg.d/yarn.gpg.asc; \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -; \
    echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list;

RUN apt-get update -qq && apt-get install -y \
  nodejs \
  postgresql-client \
  yarn

WORKDIR /app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "s", "-b", "0.0.0.0"]
