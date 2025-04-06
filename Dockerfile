FROM node:16-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# After runnning the above commands the build files will be inside /app/build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html