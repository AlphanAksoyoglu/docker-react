# this is the build phase
FROM node:alpine as builder 

WORKDIR "/app"

COPY package.json .

RUN npm install

COPY . .

CMD ["npm","run","build"]

#this is the run phase
FROM nginx
# copy stuff from the builder phase
COPY --from=builder /app/build /usr/share/nginx/html

#default cmd of nginx runs nginx and starts it so we do not need to do that

