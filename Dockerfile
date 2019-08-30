FROM archlinux/base

COPY run-pacman-cache.sh /tmp/
RUN chmod +x /tmp/run-pacman-cache.sh

ENTRYPOINT ["/tmp/run-pacman-cache.sh"]
