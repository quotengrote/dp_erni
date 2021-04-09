export http_proxy=http://11.8.108.254:8080
export https_proxy=https://11.8.108.254:8080
sudo apt install python3-pip -y
sudo python3 -m pip --proxy=11.8.108.254:8080  install ansible pykeepass==3.2.1 Jinja2 markupsafe -y
