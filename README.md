**GENEROWANIE I ZAPIS KLUCZA**
1. ssh-keygen -t ed25519 -C "mojemail@gmail.com" 
2. pbcopy < ~/.ssh/id_ed25519.pub 
3. ls -la
4. eval $(ssh-agent)
5. ssh-add ~/.ssh/id_rsa 

**TWORZENIE OBRAZU**
1.  docker build --ssh key=/home/ola/.ssh/id_ed25519 -t lab2.v1 -f Dockerfile .
2.  docker images --- **wyświetla listę obrazów**
3.  docker run -p 8080:8080 <IMAGE_ID>

**PRZESŁANIE DO DOCKERHUB**
1. docker login --- **logowanie do dockerhub**
2. docker images --- **wyświetla listę obrazów**
3. docker tag <IMAGE_ID> <NAZWA_DLA_DOCKERHUB> --- **ustalenie tagu**
4. docker push <NAZWA_DLA_DOCKERHUB>:<TAG>
