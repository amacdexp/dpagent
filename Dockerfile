FROM opensuse/leap:15.0


#Common deps
RUN zypper --non-interactive update && zypper --non-interactive refresh
RUN zypper --non-interactive install wget tar gzip curl sudo unzip libaio numactl

ARG arg
RUN if [[ -z "$arg" ]] ; then echo Argument not provided ; else echo Argument is $arg ; fi