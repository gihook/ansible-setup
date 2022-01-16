FROM archlinux:base-devel-20220109.0.43549

RUN pacman -Sy && pacman -S --noconfirm git && pacman -S --noconfirm ansible

COPY ansible-run.sh /
RUN chmod +x ansible-run.sh

ADD tasks/ /tasks
COPY local.yml /


CMD ["sh"]
