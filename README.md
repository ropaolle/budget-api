# budget-api

Express API to Budget.

## Install

```bash
git clone git@github.com:ropaolle/budget-api.git
cd budget-api
nano .env # api.budget.ropaolle.se
npm i --only=prod
pm2 start -n "Budget API" index.js
```

## PM2

```bash
# Install
sudo npm i pm2 -g
pm2 completion install
pm2 startup # Add to autostart

# Update
npm install pm2 -g && pm2 update

# Logging
tail -f /home/olle/.pm2/logs/index-error.log
tail -f /home/olle/.pm2/logs/index-out.log
```

## Add Let's Encrypt

[How to](https://itnext.io/node-express-letsencrypt-generate-a-free-ssl-certificate-and-run-an-https-server-in-5-minutes-a730fbe528ca)

```bash
# Nodeburken2017 192.168.10.46
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install certbot
# För att köra certbot utan sudo måste jag sätta config-dir, med sudo får node inte access till filerna.
certbot certonly --manual --config-dir ~/.certbot/config --logs-dir ~/.certbot/logs --work-dir ~/.certbot/work
> api.budget.ropaolle.se

# Synology (vi: a, esc, :wq)
#http://api.budget.ropaolle.se/.well-known/acme-challenge/{key}
sudo vi /var/lib/letsencrypt/.well-known/acme-challenge/{key}
```

## Docker

```bash
nano /home/olle/budget-api/.env

    BUDGET_API_JWT_SECRET=0Mc0y6e1F6mp0Mc0y6e1F6mp0Mc0y6e1F6mp
    BUDGET_API_DB=mongodb://ifarfar:QpCSdhY16346@ds034797.mlab.com:34797/ropaolle
    BUDGET_API_PORT=3001

    # Production
    NODE_ENV=production
    BUDGET_API_CORS=https://budget.ropaolle.se


cd /home/olle/budget-api
docker-compose up -d

# API: http://192.168.10.121:3001/
```