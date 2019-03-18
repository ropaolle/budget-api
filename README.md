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

## Add Let's Encrypt

```bash
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install certbot

certbot certonly --manual


http://api.budget.ropaolle.se/.well-known/acme-challenge/abcdefgh

```
