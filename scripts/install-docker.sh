pamac install docker
pamac install docker-compose

sudo systemctl start docker.service
sudo systemctl enable docker.service

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
