FROM node:14.17-alpine3.12 as base
WORKDIR /opt/node-api
COPY package.json package-lock.json ./

FROM base as local
RUN npm install
COPY . .
CMD [ "npx", "nodemon", "index.js" ]

FROM base as production
RUN npm install --only=production
COPY . .
CMD [ "node", "index.js" ]

FROM production
