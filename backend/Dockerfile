FROM docker.io/library/node:21-alpine3.18 AS BUILDER

WORKDIR /backend

COPY package.json ./
COPY package-lock.json ./
COPY src ./src
COPY tsconfig.json ./

# ci ~= install all
RUN npm ci && npm run build

# Use the official Node.js 21 image
FROM docker.io/library/node:21-alpine3.18 AS RUNNER

# Set the working directory in the container
WORKDIR /backend

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm ci
# RUN npm run build

# Copy the rest of the application code
COPY --from=BUILDER /backend/dist ./
# COPY . .

EXPOSE 8888

# Command to run the application
CMD ["npm", "run", "dev"]
# CMD [ "node", "/backend/index.js"]
