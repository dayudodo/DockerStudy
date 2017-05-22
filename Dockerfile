FROM ruby:latest
LABEL maintainer "Adam Lu <dayudodo@gmail.com>"

ENV APP_ROOT /var/app
# ENV GEM_HOME /ruby_gems
WORKDIR $APP_ROOT
# so, you can run with a volume
# docker run -d -v /wwwroot/trans2017:/var/app -p 3000:3000 rails51:trans rails s
# the real gem path is: /home/ubuntu/.rvm/gems/ruby-2.4.1
# -v /home/ubuntu/.rvm/gems/ruby-2.4.1:/ruby_gems

RUN apt-get update -yqq \
	&& apt-get install -yqq --no-install-recommends \
	postgresql-client nodejs\
	&& rm -rf /var/lib/apt/lists/*
	#  rm -rf /var/lib/apt/lists/*
# 貌似大家都会在安装完包之后把那些并不需要用到的包删除掉

# ENV BUNDLE_PATH vendor/bundle
# 安装基本的rails到镜像中，这样就可以直接使用rails new啥的
RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.org
# 其实复制啥的并不需要，因为我的卷已经准备好了，镜像一弄好，启动之后，就会自动安装gems到项目目录的vendor/bundle下面！
COPY Gemfile* ./
RUN bundle install
# COPY . .

EXPOSE 3000
# CMD bundle config mirror.https://rubygems.org https://gems.ruby-china.org
CMD rails server -b 0.0.0.0 -p 3000