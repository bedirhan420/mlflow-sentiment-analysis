FROM python:3.10-slim

WORKDIR /app

COPY . /app

# Sistem bağımlılıkları (DVC için önemlidir)
RUN apt-get update && apt-get install -y \
    git gcc curl libglib2.0-0 libsm6 libxext6 libxrender-dev \
    && rm -rf /var/lib/apt/lists/*

# pip güncelle ve kurulum
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD ["python3", "app.py"]
