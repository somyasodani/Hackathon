# specify the image you want to use build docker image

FROM python:2.7

MAINTAINER Somya <somya.sodani@gmail.com>


RUN apt update && \
    apt install -y netcat-openbsd


ENV INSTALL_PATH /Hackathon-Flask
RUN mkdir -p $INSTALL_PATH


WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

RUN chmod +x /Hackathon-Flask/docker-entrypoint.sh

CMD ["/bin/bash", "/Hackathon-Flask/docker-entrypoint.sh"]
