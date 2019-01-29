FROM ruby:2.6.0

# set up the working directory
WORKDIR /usr/src/app
ADD . /usr/src/app

# build the gem
RUN gem build brah.gemspec

# install the gem
ARG GEM_VERSION
RUN gem install "brah-$GEM_VERSION.gem"
