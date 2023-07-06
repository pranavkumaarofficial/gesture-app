# Use an official Python runtime as the base image
FROM python:3.8

# Set the working directory in the container
WORKDIR /app

#Optional - install git to fetch packages directly from github
RUN apt-get update && apt-get install -y git

# Copy the requirements.txt file to the container
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install additional system dependencies
RUN apt-get update && apt-get install -y libgl1-mesa-glx

# Copy the entire project to the container
COPY . .

# Expose the port your Streamlit app is running on (e.g., 8501)
EXPOSE 8501

# Set the command to run your Streamlit app
CMD ["streamlit", "run", "test6_app.py","--server.port=8501"]
