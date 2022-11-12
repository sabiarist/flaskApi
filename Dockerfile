# Use the `python:3.10.6` as a source image from the Amazon ECR Public Gallery
# We are not using `python:3.7-slim` from Dockerhub because it has put a  pull rate limit.
FROM public.ecr.aws/docker/library/python:3.10.6

# Set up an app directory for your code
COPY . /app
WORKDIR /app

# Install `pip` and needed Python packages from `requirements.txt`
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Define an entrypoint which will run the main app using the Gunicorn WSGI server.
ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]
