FROM ansible/ansible:latest
LABEL Name=ansible Version=0.0.1

RUN sudo apt update -y \
    && apt upgrade -y \
    

CMD ["tail", "-f", "/dev/null"]
