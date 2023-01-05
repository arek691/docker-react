# Build phase
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run Phase: we use only results of 'RUN npm run build' all above it is drop 


FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html

