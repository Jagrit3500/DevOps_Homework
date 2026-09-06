# Use lightweight official Node.js Alpine base image
FROM node:18-alpine

# Set working directory inside container
WORKDIR /app

# Copy package definition and application files
COPY package.json ./
COPY server.js ./

# Expose internal listening port
EXPOSE 3000

# Run the web application
CMD ["node", "server.js"]
