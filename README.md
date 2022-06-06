# SimpleRepo
Simple File Repository

htpasswd .htpasswd user1  
docker build --build-arg ip=0.0.0.0 -t simplerepo .  
docker run --name fs -d -p 80:80 -v /var/vv:/files:ro -d simplerepo  