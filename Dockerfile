# Use a lightweight Nginx image
FROM nginx:alpine
# Copy build files to Nginx HTML directory
COPY build/ /usr/share/nginx/html
# Expose port 3000
EXPOSE 3000
# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
