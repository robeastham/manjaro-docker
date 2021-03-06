FROM jonathonf/manjaro:latest
MAINTAINER Rob Eastham <rob.eastham@clearview.net>

#########################################
##        ENVIRONMENTAL CONFIG         ##
#########################################
# Set correct environment variables
# ENV HOME="/root" LC_ALL="C.UTF-8" LANG="en_US.UTF-8" LANGUAGE="en_US.UTF-8"

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

#########################################
##         RUN INSTALL                 ##
#########################################
RUN pacman-mirrors -g
RUN mkdir /root/.gnupg
RUN touch /root/.gnupg/drmngr_ldapservers.conf
RUN dirmngr < /dev/null
RUN pacman-key --refresh-keys
RUN pacman --noconfirm -Syyu
RUN pacman --noconfirm -S gnupg
RUN pacman-key populate archlinux
RUN pacman-key populate manjaro
RUN pacman --noconfirm -Syyu
CMD ["echo 'Hello this is an echo echo echo...''"]

#########################################
##         EXPORTS AND VOLUMES         ##
#########################################
VOLUME /manjaro1
EXPOSE 9000/tcp 9000
EXPOSE 9001/tcp 9001
EXPOSE 22/tcp 49155
