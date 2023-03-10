FROM  python:3.9.2-alpine AS builder
ENV PYTHONUNBUFFERED 1
EXPOSE 8000
WORKDIR /app 
COPY requirements.txt /app
RUN apk -U upgrade && \
    apk --no-cache add gcc  \
    musl-dev \
    postgresql-dev \
    python3-dev && \
    pip3 install --upgrade pip &&\ 
    pip3 install -r requirements.txt --no-cache-dir
ADD SkillFactory/. /app
ENTRYPOINT ["python3"] 
CMD ["manage.py", "runserver", "0.0.0.0:8000"]


 


