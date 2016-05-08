FROM ruby:2.3.1-alpine

RUN apk add --update \
  build-base \
  libxml2-dev \
  libxslt-dev \
  sqlite-dev \
  && rm -rf /var/cache/apk/*

WORKDIR /usr/src/app
COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install
COPY . /usr/src/app

ENV RAILS_ENV production

RUN apk add --update curl git bash file

# MeCab
ENV MECAB_URL https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7cENtOXlicTFaRUE
ENV MECAB_VERSION 0.996
RUN curl -SL -o mecab-${MECAB_VERSION}.tar.gz ${MECAB_URL}
RUN tar zxf mecab-${MECAB_VERSION}.tar.gz
RUN cd mecab-${MECAB_VERSION} \
  && ./configure --enable-utf8-only --with-charset=utf8 \
  && make \
  && make install

# IPA辞書
ENV IPADIC_URL https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7MWVlSDBCSXZMTXM
RUN curl -SL -o mecab-ipadic-2.7.0-20070801.tar.gz ${IPADIC_URL}
RUN tar zxf mecab-ipadic-2.7.0-20070801.tar.gz
RUN cd mecab-ipadic-2.7.0-20070801 \
  && ./configure --with-charset=utf8 \
  && make \
  && make install

# NEologd
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
RUN mecab-ipadic-neologd/bin/install-mecab-ipadic-neologd -n

# あとしまつ
RUN apk del curl git bash build-base file
RUN rm -rf \
  mecab-${MECAB_VERSION}* \
  mecab-ipadic-2.7.0-20070801* \
  mecab-ipadic-neologd


CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
