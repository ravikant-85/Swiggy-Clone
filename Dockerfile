FROM node:20.18.0-slim

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build  # Build React app

RUN npm install -g serve  # Install serve globally

EXPOSE 3000

CMD ["serve", "-s", "build"]