# Use an official Python runtime as a parent image
FROM python:3.9

# Set environment variables
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

COPY requirements.txt /app

RUN pip install --upgrade pip

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
 
# Expose port 8000 for the Django development server
EXPOSE 8000

# Collect static files
#RUN python manage.py collectstatic --noinput

# Run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
