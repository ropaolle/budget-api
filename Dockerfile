FROM node:10-alpine

# Allow to install global npm packages
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

# Install PM2
RUN npm i -g pm2

# Install npm packages
#WORKDIR /home/olle/budget-api
#RUN npm i x

CMD [ "pm2-runtime", "start", "pm2.json" ]
