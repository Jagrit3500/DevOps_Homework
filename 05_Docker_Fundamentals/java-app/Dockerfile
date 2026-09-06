# Use lightweight OpenJDK base image
FROM eclipse-temurin:17-jdk-alpine

# Set working directory
WORKDIR /app

# Copy Java source code
COPY Main.java .

# Compile Java code
RUN javac Main.java

# Expose port
EXPOSE 8080

# Run compiled class
CMD ["java", "Main"]
