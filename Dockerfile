# Installerar PM2, npm-packet, kpierar kod och startar app.
#
# [Build]
# docker build -t ropaolle/budget-api .
# 
# [Run]
# docker run --detach \
#    --name budget-api \
#    --env "VIRTUAL_HOST=api.budget.ropaolle.se" \
#    --env "VIRTUAL_PORT=3001" \
#    --env "LETSENCRYPT_HOST=api.budget.ropaolle.se" \
#    --env "LETSENCRYPT_EMAIL=ropaolle@gmail.com" \
#    ropaolle/budget-api:latest    

FROM node:10-alpine

# Allow to install global npm packages
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

# Install PM2
RUN npm i -g pm2

# Create app directory
WORKDIR /home/olle/budget-api

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# Development
#RUN npm install
# Production
RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 3001
#CMD [ "npm", "start" ]
CMD [ "pm2-runtime", "start", "pm2.json" ]
