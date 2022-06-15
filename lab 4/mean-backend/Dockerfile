FROM node:latest

# Create app directory
WORKDIR /usr/src/backend

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# USER tweeker

RUN npm install

COPY . .

EXPOSE 5019

CMD [ "npm", "start" ]