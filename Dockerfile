FROM ubuntu:20.04

ENV PYTHONUNBUFFERED=1
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y python3.7
RUN apt-get install -y --no-install-recommends python3-pip
RUN pip install --upgrade pip

RUN mkdir /app
WORKDIR /app
ADD . /app

RUN pip install -r requirements.txt




