FROM node:10.9.0

COPY . .

RUN npm install

EXPOSE 80000

CMD npm start
