
FROM node:10

WORKDIR /home/olle/budget-api

#COPY . /app

# Allow to install global npm packages
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin


#RUN apk-get update && apk-get add python make g++

# Install PM2
RUN npm i -g pm2

CMD [ "pm2-runtime", "start", "pm2.json" ]
#CMD ["pm2-runtime", "process.yml"]
