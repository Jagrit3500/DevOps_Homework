# ==============================================================================
# Multi-Stage Dockerfile
# Stage 1: Build & Assets Preprocessing Stage
# ==============================================================================
FROM alpine:3.19 AS builder

WORKDIR /build

# Copy source assets
COPY src/ /build/

# Simulate optimization / asset preparation step
RUN echo "<!-- Built via Docker Multi-Stage Pipeline -->" >> /build/index.html

# ==============================================================================
# Stage 2: Minimal Production Runtime
# ==============================================================================
FROM nginx:alpine AS runner

# Remove default nginx configurations
RUN rm -rf /etc/nginx/conf.d/*

# Copy custom configuration listening on port 8080
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy ONLY built artifacts from builder stage (no compiler/build tools in final image)
COPY --from=builder /build/index.html /usr/share/nginx/html/index.html

# Expose port 8080 as specified in the homework
EXPOSE 8080

# Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
