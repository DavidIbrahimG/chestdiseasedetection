FROM python:3.10-slim-buster

WORKDIR /app

# Install dependencies for unzip + curl
RUN apt-get update -y && apt-get install -y curl unzip \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf awscliv2.zip aws

COPY . /app
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "app.py"]
