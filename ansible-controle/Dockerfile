FROM python:3.11-slim

# Basics + SSH client (for host key mgmt) + useful tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-client git sshpass nano curl && \
    rm -rf /var/lib/apt/lists/*

# Ansible
RUN pip install --no-cache-dir "ansible>=9,<10"

# A sane default config INSIDE the container (avoids world-writable-dir issues)
RUN printf "%s\n" \
    "[defaults]" \
    "inventory = /work/inventory.ini" \
    "roles_path = /work/roles" \
    "collections_paths = /work/collections" \
    "host_key_checking = False" \
    "stdout_callback = yaml" \
    "interpreter_python = auto_silent" \
    > /root/.ansible.cfg

WORKDIR /work
ENTRYPOINT ["/bin/bash"]
CMD ["-c", "ansible --version && exec bash"]