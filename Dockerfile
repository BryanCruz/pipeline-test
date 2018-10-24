FROM bryanbcruz/nginx-hello-world:latest

RUN apt update && apt install -y curl

COPY app /usr/share/nginx/html
