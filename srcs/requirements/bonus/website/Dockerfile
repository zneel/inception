FROM alpine:3.17

LABEL version="1.0"
LABEL description="react builder"

RUN apk update && apk add nodejs npm
RUN mkdir -p /var/www/mywebsite

RUN mkdir -p /app
WORKDIR /app
COPY ./site .
COPY ./tools/init.sh .
RUN npm install
RUN npm run build

CMD [ "sh", "init.sh" ]