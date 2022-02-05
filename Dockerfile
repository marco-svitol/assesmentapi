FROM node:12.22.8
ENV NODE_ENV=production
ENV TIKOAPI_SERVERPORT=80

WORKDIR /nodejs
COPY ["package.json", "package-lock.json*", "./"]

RUN npm install --production

EXPOSE 80

COPY . .

CMD ["npm", "start"]