# Use an official Node.js image as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json (if you have one) into the container
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of your application files into the container
COPY . .

# Expose the port your app is listening on
EXPOSE 3000

# Set the environment variable to switch between dev and prod
ENV NODE_ENV=production

# Command to start the app in production
CMD ["npm", "start"]

