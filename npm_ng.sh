#!/bin/bash

cd  /usr/share/nginx/html/frontend/
npm install
npm audit fix --force
ng build --prod

