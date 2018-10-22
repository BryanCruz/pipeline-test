FROM bryanbcruz/nginx-hello-world:latest

RUN apt update && apt install -y curl
