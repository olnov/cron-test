FROM debian:latest

WORKDIR /app
COPY . .

RUN apt-get update && \
    apt-get install -y python3 python3-pip cron

RUN chmod +x /app/entry_point.sh

ENTRYPOINT [ "/app/entry_point.sh" ]
