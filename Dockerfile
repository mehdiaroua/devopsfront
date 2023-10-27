# Stage 1: Build the Angular app
FROM node:latest as node
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN ng build --prod

# Stage 2: Serve the Angular app using Nginx
FROM nginx:alpine
COPY --from=node /app/dist/ /usr/share/nginx/html
EXPOSE 80
