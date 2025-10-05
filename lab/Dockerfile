FROM jrei/systemd-ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    openssh-server sudo python3 python3-apt python3-pip curl gnupg lsb-release \
    && rm -rf /var/lib/apt/lists/*

# SSH
RUN mkdir -p /var/run/sshd \
    && useradd -m -s /bin/bash azureuser \
    && echo 'azureuser ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/90-azureuser \
    && chmod 440 /etc/sudoers.d/90-azureuser \
    && echo 'azureuser:azureuser' | chpasswd \
    && sed -ri 's/^#?PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Enable sshd
RUN systemctl enable ssh

