# Use the official Node.js 21 image
FROM docker.io/library/node:21-alpine3.18 AS RUNNER

# Set the working directory in the container
WORKDIR /frontend

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose port 5173
EXPOSE 5173

# Command to run the application
CMD ["npm", "run", "dev", "--", "--host"]