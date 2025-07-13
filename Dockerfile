FROM oraclelinux:8

ARG release=19
ARG update=26

USER root

# Copy files
COPY bin /usr/lib/oracle/${release}.${update}/client64/bin
COPY lib /usr/lib/oracle/${release}.${update}/client64/lib

# Fill environment variables
ENV PATH=/usr/lib/oracle/${release}.${update}/client64/bin:$PATH
ENV LD_LIBRARY_PATH=/usr/lib/oracle/${release}.${update}/client64/lib:$LD_LIBRARY_PATH

# Grant exec rights
RUN chmod -R a+rx /usr/lib/oracle/${release}.${update}/client64/lib && \
    chmod a+rx /usr/lib/oracle/${release}.${update}/client64/bin/tkprof

WORKDIR /trace
ENTRYPOINT ["tkprof"]