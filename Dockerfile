FROM debian:stable-slim

WORKDIR /usr/src

RUN apt -y update
RUN apt -y install sipsak

CMD ["/bin/bash"]
