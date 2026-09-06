# Use lightweight official Nginx Alpine image
FROM nginx:alpine

# Copy React Single Page App to Nginx html directory
COPY index.html /usr/share/nginx/html/index.html

# Expose web port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
