FROM ubuntu:24.04

RUN apt update && apt install -y --no-install-recommends git jq openjdk-21-jre-headless wget \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}

ENV PROVERS_DIR=/Provers
ENV SIREUM_HOME=${PROVERS_DIR}/Sireum
ENV SIREUM_V=master
ENV PATH=${SIREUM_HOME}/bin:${PATH}

RUN mkdir -p ${PROVERS_DIR}

COPY install-minimal-sireum.sh .
RUN chmod +x install-minimal-sireum.sh && ./install-minimal-sireum.sh


