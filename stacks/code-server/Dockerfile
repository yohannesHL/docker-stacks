FROM codercom/code-server

ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG USERNAME=coder
ARG DOCKER_GID=984
ARG PACKAGES=

# [Optional] Update UID/GID if needed
RUN if [ "$USER_GID" != "1000" ] || [ "$USER_UID" != "1000" ]; then \
        groupmod --gid $USER_GID $USERNAME \
        && usermod --uid $USER_UID --gid $USER_GID $USERNAME; \
    fi 
RUN chown -R $USER_UID:$USER_GID /home/$USERNAME; 
#RUN sudo groupadd -g $DOCKER_GID docker && \
#	sudo usermod -aG docker coder && \
#	newgrp docker

# ** [Optional] Uncomment this section to install additional packages. **
#
# ENV DEBIAN_FRONTEND=noninteractive
# RUN apt-get update \
#    && apt-get -y install --no-install-recommends <your-package-list-here> \
#    #
#    # Clean up
#    && apt-get autoremove -y \
#    && apt-get clean -y \
#    && rm -rf /var/lib/apt/lists/*
# ENV DEBIAN_FRONTEND=dialog


RUN sudo apt-get update \
   && sudo apt-get remove docker docker-engine docker.io containerd runc \
   ; sudo apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common \
   && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - \
   && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" \
   && sudo apt-get update \
   && sudo apt-get -y install docker-ce docker-ce-cli containerd.io
 
RUN sudo apt-get -y install --no-install-recommends $PACKAGES \
   && sudo apt-get autoremove -y \
   && sudo apt-get clean -y \
   && sudo rm -rf /var/lib/apt/lists/*

#RUN sudo usermod -aG docker $USERNAME
RUN sudo groupmod -g $DOCKER_GID docker
RUN sudo usermod -aG docker $USERNAME
RUN newgrp docker
RUN sudo -su $USERNAME
RUN id coder 

#RUN sudo mkdir /docker
#COPY docker-19.03.9.tgz /docker
#RUN cd /docker && sudo tar xzvf ./docker-19.03.9.tgz
#RUN sudo cp /docker/docker/* /usr/bin/
#RUN sudo chown -hR coder:docker /docker/docker

COPY setup_extras.sh /
COPY entrypoint.sh /
RUN sudo chmod +x /entrypoint.sh /setup_extras.sh
RUN /setup_extras.sh

ENTRYPOINT /entrypoint.sh

