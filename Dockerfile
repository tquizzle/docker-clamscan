FROM centos:latest
LABEL maintainer="Travis Quinnelly <t.quinnelly@gmail.com>"

RUN yum upgrade -y \
    && yum -y install epel-release \
    && yum -y install clamav

ENV SCANDIR=/scan
COPY scan.sh /scan.sh
ENTRYPOINT [ "/scan.sh" ]
