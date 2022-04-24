FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt -y upgrade && apt -y install python3.9 python3-pip bcc python3-bpfcc bpfcc-tools linux-headers-$(uname -r)

RUN pip3 install pandas ray && mkdir -p /stacks

COPY arvos-poc.py /arvos-poc.py
COPY arthas.py /arthas.py
COPY parsexml.py /parsexml.py
COPY arvos_vfs.json /arvos_vfs.json

RUN chmod +x arvos-poc.py && chmod 755 arvos-poc.py

ENTRYPOINT ["./arvos-poc.py"]
