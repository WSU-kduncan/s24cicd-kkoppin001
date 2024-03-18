# Use the official Nginx image as the base image
FROM nginx:latest

# Copy the contents of the website directory to the default Nginx document root
COPY ./website/ /usr/share/nginx/html/

