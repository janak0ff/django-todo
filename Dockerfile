# Use an official Python runtime as a parent image
FROM python:3

# Set the working directory in the container
WORKDIR /app

# Install Django (ideally from requirements.txt, but using direct install for this example)
RUN pip install django==5.2.4

# Copy the entire Django project into the container
# The .dockerignore file will prevent unwanted files like 'venv/' from being copied
COPY . .

# Run database migrations
RUN python3 manage.py migrate

# Expose the port that the Django development server will listen on
EXPOSE 7777

# Define the command to run the application
# We'll use port 8001 for the Dockerized version to distinguish it
CMD ["python3","manage.py", "runserver", "0.0.0.0:7777"]

