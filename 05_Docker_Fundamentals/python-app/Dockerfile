# Use official lightweight Python image
FROM python:3.11-alpine

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application source code
COPY app.py .

# Expose web port
EXPOSE 5000

# Run Flask application
CMD ["python", "app.py"]
