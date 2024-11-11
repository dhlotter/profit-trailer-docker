cd ~/profit-trailer

> Dockerfile && nano Dockerfile 
> setup.sh && nano setup.sh

sudo rm -rf /app/* 

sudo docker build -t profittrailer .
sudo docker build --no-cache -t profittrailer .
sudo docker run -it --rm profittrailer


sudo docker stop profit-trailer && sudo docker rm profit-trailer
sudo docker run \
    --name profit-trailer \
    --restart unless-stopped \
    -e PUID=1000 \
    -e PGID=1000 \
    -e PT_ENV=dev \
    -p 9701:8081 \
    -v /mnt/external/docker/profit-trailer/data:/app/data \
    -v /mnt/external/docker/profit-trailer/logs:/app/logs \
    -d dhlotter/profit-trailer-docker:latest

sudo docker logs profit-trailer-dev
sudo docker logs --follow profit-trailer-dev

sudo docker exec -it profit-trailer-dev sh

















sudo wget https://download.profittrailer.com/ProfitTrailer.zip /tmp

sudo unzip -jqd /pt1 /tmp/ProfitTrailer.zip  
sudo unzip -jqd /pt2 /tmp/ProfitTrailer.zip 
rm /tmp/ProfitTrailer.zip







