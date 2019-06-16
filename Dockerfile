FROM centos:latest
LABEL maintainer="Travis Quinnelly <tquinnelly@gmail.com>"

RUN yum -y install epel-release && \
    yum -y install clamav

ENV SCANDIR=/scan
COPY scan.sh /scan.sh
ENTRYPOINT [ "/scan.sh" ]
