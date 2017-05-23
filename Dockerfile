FROM ruby:latest
LABEL maintainer "Adam Lu <dayudodo@gmail.com>"

ENV APP_ROOT /var/app
# ENV GEM_HOME /ruby_gems
WORKDIR $APP_ROOT

RUN apt-get update -yqq \
	&& apt-get install -yqq --no-install-recommends \
	postgresql-client nodejs\
	&& rm -rf /var/lib/apt/lists/*
# 删除不再需要的包

# ENV BUNDLE_PATH vendor/bundle
# gems中国镜像
RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.org
# 复制并且安装gems到镜像中会减少N多启动的问题
COPY Gemfile* ./
RUN bundle install

EXPOSE 3000
CMD rails server -b 0.0.0.0 -p 3000