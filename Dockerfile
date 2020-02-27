FROM ubuntu:18.04
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN apt-get update &&\
  apt-get install -y build-essential git libcurl4 libcurl4-openssl-dev libxml2 libxml2-dev libssl-dev cmake &&\
  git clone --depth 1 https://github.com/taganaka/SpeedTest &&\
  cd SpeedTest &&\
  cmake -DCMAKE_BUILD_TYPE=Release . &&\
  make install &&\
  apt-get purge -y build-essential git libcurl4-openssl-dev libxml2-dev libssl-dev cmake &&\
  apt-get autoremove -y &&\
  rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["SpeedTest"]
CMD ["--share"]
