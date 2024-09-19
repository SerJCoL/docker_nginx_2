# Create image based on the official Node image
FROM node:12

# Create a directory where our app will be placed
RUN mkdir -p /usr/src/app

# Change directory so that our commands run inside this new directory
WORKDIR /usr/share/nginx/html/

# Copy dependency definitions
COPY package.json /usr/src/app

# Install dependecies
RUN npm install

# Get all the code needed to run the app
COPY ./index.html /usr/share/nginx/html/index.html

# Expose the port the app runs in
EXPOSE 9889 80

ENTRYPOINT ["./index.html", "/usr/share/nginx/html/index.html"]

# Serve the app
CMD ["npm", "start", "nginx", "-g", "daemon off;"]

