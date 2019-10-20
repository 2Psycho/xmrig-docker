FROM ubuntu

ENV VERSION 4.3.1-beta

RUN apt-get update && apt-get install -y wget

RUN wget https://github.com/xmrig/xmrig/releases/download/v$VERSION/xmrig-$VERSION-xenial-x64.tar.gz

RUN tar -xvzf xmrig-$VERSION-xenial-x64.tar.gz

ENV POOL stratum+tcp://pool.supportxmr.com:5555
ENV USERNAME 4GdoN7NCTi8a5gZug7PrwZNKjvHFmKeV11L6pNJPgj5QNEHsN6eeX3DaAQFwZ1ufD4LYCZKArktt113W7QjWvQ7CWFn5rP6uvRz373DuPP
ENV DONATE 1
ENV THREADS 4

WORKDIR xmrig-$VERSION/

CMD ./xmrig -o $POOL -u $USERNAME -p x -k --donate-level=$DONATE -t $THREADS --coin monero 
