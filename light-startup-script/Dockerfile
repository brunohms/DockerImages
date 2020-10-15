FROM alpine:3.12.0


RUN apk -q update && apk -q add --no-cache --upgrade bash
COPY --chown=root:root manage-startup-script.sh /
CMD ["/bin/bash", "-c", "/manage-startup-script.sh"]