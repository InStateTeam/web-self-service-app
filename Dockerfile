# Stage 1: Build fims web app
FROM shito/alpine-node-gulp as node

WORKDIR /usr/src/app

COPY package*.json ./

# RUN npm init

RUN npm install

COPY . .

RUN gulp build

# Stage 2: Host Fims web app on Nginx
FROM nginx:1.17.4

RUN rm -f /etc/nginx/nginx.conf

COPY dist /usr/share/nginx/html

COPY ./scripts/nginx/docker.nginx.conf /etc/nginx/nginx.conf

EXPOSE 8888


CMD ["nginx", "-g", "daemon off;"]
