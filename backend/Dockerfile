# Use the official Node.js 21 image
FROM docker.io/library/node:21-alpine3.18 AS RUNNER

# Set the working directory in the container
WORKDIR /backend

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

EXPOSE 8888

# Command to run the application
CMD ["npm", "run", "dev"]