FROM node:18

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY app ./app

EXPOSE 3001

CMD ["node","app/server.js"]