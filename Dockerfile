FROM python:3.9-alpine
RUN apk add --no-cache gcc musl-dev linux-headers

WORKDIR /src
COPY . .
COPY ./requirements.txt ./requirements.txt

RUN pip3 install --no-cache-dir --upgrade -r requirements.txt

EXPOSE 5050

CMD ["python3", "manage.py", "makemigrations"]
CMD ["python3", "manage.py", "migrate"]
CMD ["python3", "manage.py", "runserver", "5050"]