FROM ansible/ansible:latest
LABEL Name=ansible Version=0.0.1

RUN echo "=== Now Running Ansible ==="

CMD ["tail", "-f", "/dev/null"]
