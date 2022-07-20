FROM opensuse/leap:15.4


#Common deps
RUN zypper --non-interactive update && zypper --non-interactive refresh
RUN zypper --non-interactive install wget tar gzip curl sudo unzip libaio numactl


COPY downloads/. /tmp/.


ARG arg
RUN if [[ -z "$arg" ]] ; then echo Argument not provided ; else echo Argument is $arg ; fi

RUN groupadd dpagent && \
    useradd dpagent -G dpagent    && \
    mkdir -p /usr/sap && \
    chmod g+rw /usr/sap && \
    mkdir -p /usr/sap/dataprovagent && \   
    mkdir -p /usr/sap/dataprovagent/log && \
    chown -R dpagent:dpagent /usr/sap/dataprovagent && \
    mkdir -p /home && \
    mkdir -p /home/dpagent && \
    chmod g+rwx /home/dpagent && \
    chown -R dpagent:dpagent /home/dpagent


USER dpagent

ENV DPA_INSTANCE=/usr/sap/dataprovagent/bin

