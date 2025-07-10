FROM oraclelinux:8

ARG release=19
ARG update=26

USER root

# Копирование папки bin c tkprof внутрь образа
COPY bin /usr/lib/oracle/${release}.${update}/client64/bin
COPY lib /usr/lib/oracle/${release}.${update}/client64/lib
ENV PATH=/usr/lib/oracle/${release}.${update}/client64/bin:$PATH
ENV LD_LIBRARY_PATH=/usr/lib/oracle/${release}.${update}/client64/lib:$LD_LIBRARY_PATH

# Выдача прав
RUN chmod -R a+rx /usr/lib/oracle/${release}.${update}/client64/lib && \
    chmod a+rx /usr/lib/oracle/${release}.${update}/client64/bin/tkprof

WORKDIR /trace
ENTRYPOINT ["tkprof"]