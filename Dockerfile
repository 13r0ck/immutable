# 1 Get builder container
From ubuntu:jammy
WORKDIR /usr

# 2 Fetch updates & Deps necessary for system76 PPA 
RUN apt-get update
RUN apt-get install software-properties-common -y

# 3 Add system76 PPA, Install Upgrades, and general Deps
RUN add-apt-repository ppa:system76-dev/stable
RUN apt-get update
RUN apt-get full-upgrade -y
RUN apt-get install python3-pip git -y

# 4 Install latest mkosi
RUN git clone https://github.com/systemd/mkosi
WORKDIR /usr/mkosi
RUN pip3 install --user --no-use-pep517 --editable .

CMD ["bash"]
