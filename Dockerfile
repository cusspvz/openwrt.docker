MAINTAINER José Moreira <jose.moreira@findhit.com>

RUN mkdir \
        /var/run \
        /var/log \
        /var/lock \
    ; \
    opkg update; \
    opkg install \
        bash \
    ;

CMD [ "/bin/login.sh" ]
