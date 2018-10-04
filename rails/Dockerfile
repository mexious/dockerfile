FROM        ubuntu:16.04
MAINTAINER  Yuga <yuga@icube.us>

RUN apt-get update
RUN apt-get install -y software-properties-common build-essential curl nodejs ruby-full
RUN apt-add-repository -y ppa:rael-gc/rvm
RUN apt-get update
RUN touch /etc/profile.d/rvm.sh
RUN apt-get install -y rvm
RUN bash -c 'source /usr/share/rvm/scripts/rvm'
RUN gem install bundler --no-ri --no-rdoc
RUN gem install rails

# Create new rails project
RUN rails new app

ENV RAILS_APP /app
WORKDIR $RAILS_APP 

EXPOSE 3000

CMD ["rails", "server"]
