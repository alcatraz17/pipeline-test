# Use the specified Node.js version
ARG VERSION=20
FROM node:${VERSION}

# Print a message
RUN echo "We are going to do cool things here! 🚀"

# Set the working directory inside the container
WORKDIR /pipeline

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
ENTRYPOINT ["npm", "run"]
CMD ["start"]

# Print build information
ARG VERSION
RUN echo "Pipeline build on nodejs version ${VERSION}!"

# Print a completion message
RUN echo "We are done! 🎉"