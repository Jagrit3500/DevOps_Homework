# Use official Nginx Alpine image
FROM nginx:alpine

# Copy static webpage to default Nginx docroot
COPY index.html /usr/share/nginx/html/index.html

# Expose HTTP port
EXPOSE 80

# Run Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
