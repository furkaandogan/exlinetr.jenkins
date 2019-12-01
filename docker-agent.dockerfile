FROM jenkins/slave:alpine

USER root

RUN apk update

RUN apk add docker