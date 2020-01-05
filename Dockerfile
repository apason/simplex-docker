FROM ubuntu

WORKDIR /app

RUN apt-get update && apt-get install -y git gcc

RUN git clone https://github.com/apason/simplex

WORKDIR /app/simplex

RUN gcc simplex.c -o simplex

RUN echo "#!/bin/sh" > starter.sh
RUN echo "cat \$1 | ./simplex" >> starter.sh

RUN chmod +x starter.sh

ENTRYPOINT ["./starter.sh"]
