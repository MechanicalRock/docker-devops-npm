FROM ubuntu

ENV NODE_VERSION v7.2.1
ENV LANG en_US.UTF-8

RUN locale-gen en_US en_US.UTF-8
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y python python-dev python-pip python3 python3-dev python3-pip \
                                                      curl git build-essential libssl-dev ruby-dev \
                                                      libpq-dev libmysqlclient-dev \
                                                      libjpeg8-dev zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*
RUN pip install git+https://github.com/jonls/s3-deploy-website
RUN git clone https://github.com/creationix/nvm.git /.nvm
RUN apt-get update
RUN apt-get -y install nodejs && \
    apt-get -y install npm
RUN apt-get install -y openjdk-8-jre
