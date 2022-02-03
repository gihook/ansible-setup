FROM archlinux:base-devel-20220109.0.43549

RUN pacman -Sy \
  && pacman -S --noconfirm git ansible openssh 

RUN groupadd --gid 1000 nikola
RUN useradd --uid 1000 --gid 1000 --create-home nikola

# add user to sudoers
RUN usermod -a -G wheel nikola
RUN sed -i "s/\# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/" /etc/sudoers

WORKDIR /home/nikola

COPY . ./ansible
RUN chown -R nikola:nikola /home/nikola/ansible

USER nikola

CMD ["sh"]
