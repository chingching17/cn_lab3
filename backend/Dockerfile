FROM docker.io/library/node:21-alpine3.18 AS BUILDER

WORKDIR /backend

COPY package.json ./
COPY package-lock.json ./
COPY src ./src
COPY tsconfig.json ./

# ci ~= install all
RUN npm ci
RUN npm run build

# multistage dockerfile
FROM docker.io/library/node:21-alpine3.18 AS RUNNER

EXPOSE 8888

WORKDIR /backend

COPY package.json ./
COPY package-lock.json ./

# Copy from previous stage
COPY --from=BUILDER /backend/dist ./

# docker run -d -p 27017:27017 mongo
# Install package without dev 
# Less 
RUN npm ci
#--omit=dev
ENV PORT=8888
ENV HOST=0.0.0.0
# docker inspect mongodb | grep IPAddress
ENV MONGO_CONNECTION_STRING=mongodb://db:27017/myMernApp

#CMD ["env"]
#CMD ["ls", "types"]
CMD [ "node", "/backend/index.js"]