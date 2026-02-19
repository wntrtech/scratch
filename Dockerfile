FROM alpine:3.22 AS dev

ARG TZ='Europe/Riga'

RUN apk add --no-cache tzdata=2025c-r0 ca-certificates=20250911-r0 && \
    cp /usr/share/zoneinfo/${TZ} /etc/localtime && \
    echo ${TZ} > /etc/timezone && \
    addgroup -g 1000 app && \
    adduser -D -u 1000 -G app app && \
    mkdir -p /tmp && chown app:app /tmp && chmod 700 /tmp

FROM scratch AS stage

COPY --from=dev /etc/passwd /etc/passwd
COPY --from=dev /etc/group /etc/group
COPY --from=dev /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=dev /etc/localtime /etc/localtime
COPY --from=dev /usr/share/zoneinfo/ /usr/share/zoneinfo/

FROM scratch

ARG TZ='Europe/Riga'
ENV DEFAULT_TZ=${TZ} \
    TZ=${TZ} \
    LC_ALL=lv_LV.UTF-8 \
    LANG=lv_LV.UTF-8

WORKDIR /
USER app:app

COPY --from=stage / /
COPY --from=dev --chown=app:app /tmp /tmp