#First step to build app 
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#Second step to serve the files
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html


