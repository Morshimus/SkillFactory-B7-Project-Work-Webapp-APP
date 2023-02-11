FROM  python:3.9.2-alpine AS builder
ENV FAVICON=https://skillfactory.ru/favicon.ico
ENV PYTHONUNBUFFERED 1
EXPOSE 8000
WORKDIR /app 
COPY requirements.txt /app
RUN apk add gcc  \
    musl-dev && \
    pip3 install --upgrade pip &&\ 
    pip3 install -r requirements.txt --no-cache-dir
COPY SkillFactory/. /app
ADD $FAVICON  /app/static/polls/favicon.ico
ENTRYPOINT ["python3"] 
CMD ["manage.py", "runserver", "0.0.0.0:8000"]


 


