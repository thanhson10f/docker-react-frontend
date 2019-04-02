FROM node:alpine as builder

WORKDIR '/react-frontend'

COPY ./package.json .
RUN npm install

COPY . .
RUN npm run build


FROM nginx
COPY --from=builder /react-frontend/build /usr/share/nginx/html
