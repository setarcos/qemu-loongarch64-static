FROM debian:trixie-slim
RUN apt update \
  && apt-get download qemu-user-static \
  && dpkg --unpack qemu*

FROM busybox
COPY --from=0 /usr/bin/qemu-loongarch64-static /usr/bin/
ADD ./register.sh /register
ENTRYPOINT ["/register"]
