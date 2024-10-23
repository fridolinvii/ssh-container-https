# Dockerfile
FROM ubuntu:latest

# Install OpenSSH server
RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd

# Create a user for SSH access
RUN useradd -m -s /bin/bash user && \
    mkdir -p /home/user/.ssh && \
    chmod 700 /home/user/.ssh

# Copy your public key for SSH key-based authentication
COPY authorized_keys /home/user/.ssh/authorized_keys
RUN chmod 600 /home/user/.ssh/authorized_keys && \
    chown -R user:user /home/user/.ssh

# SSH configuration settings
RUN echo "GatewayPorts yes" >> /etc/ssh/sshd_config && \
    echo "PasswordAuthentication no" >> /etc/ssh/sshd_config && \
    echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "PermitRootLogin no" >> /etc/ssh/sshd_config

# Expose the SSH port
EXPOSE 22

# Start the SSH service
CMD ["/usr/sbin/sshd", "-D"]
