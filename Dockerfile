
FROM node:10



#COPY . /app

# Allow to install global npm packages
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin


#RUN apk-get update && apk-get add python make g++

# Install PM2
RUN npm i -g pm2

# Install npm packages
#WORKDIR /home/olle/budget-api
#RUN npm i x

CMD [ "pm2-runtime", "start", "pm2.json" ]
#CMD ["pm2-runtime", "process.yml"]
