FROM node:10-alpine

# Allow to install global npm packages
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

# Install PM2
RUN npm i -g pm2

# Create app directory
#WORKDIR /usr/src/app
WORKDIR /home/olle/budget-api

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 3001
#CMD [ "npm", "start" ]
CMD [ "pm2-runtime", "start", "pm2.json" ]