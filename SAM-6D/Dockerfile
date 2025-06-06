FROM lihualiu/sam-6d:1.0

USER root

RUN apt -y update \
    && apt -y upgrade \
    && apt install -y wget 

SHELL ["/bin/bash", "--login", "-c"]

RUN . /opt/conda/etc/profile.d/conda.sh \
    && conda activate sam6d

