FROM python:3.6-jessie as builder

RUN apt-get install -y libmysqlclient-dev

RUN mkdir /install
WORKDIR /install

COPY requirements.txt ./
RUN pip install --prefix=/install --ignore-installed -r requirements.txt


FROM python:3.6-jessie

COPY --from=builder /install /usr/local

RUN mkdir /app
WORKDIR /app
COPY . /app

RUN python manage.py migrate
RUN python manage.py import_company resources/companies.json -d
RUN python manage.py import_people resources/people.json -d

EXPOSE 7000

CMD ["gunicorn", "--bind", ":7000", "--workers", "3", "paranuara.wsgi:application"]
