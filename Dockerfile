FROM ubuntu:20.04
LABEL version="1"
LABEL description="Container for petergeneric's Unifi-Protect-Remux and dependencies"
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y wget \
 && rm -rf /var/lib/apt/lists/*

COPY . /bin

RUN wget https://archive.org/download/ubnt_ubvinfo/ubnt_ubvinfo
RUN mv ubnt_ubvinfo /bin/ubnt_ubvinfo
RUN chmod +x /bin/ubnt_ubvinfo

ENTRYPOINT ["remuxscript.sh"]
