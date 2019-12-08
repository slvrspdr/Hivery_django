# Hivery
Hivery Paranuara Challenge(django)


### Prequisites

- Python 3.6+
- [Docker](https://www.docker.com/) and [Docker Compose](https://docs.docker.com/compose/)
- [pipenv](https://pipenv.readthedocs.io/en/latest/)
- MySQL 5.7+

### Setup

- Install dependencies and activate virtualenv:

  ```
  pipenv install
  pipenv shell # activate python virtualenv
  ```

- Build & launch development server

  ```
  docker-compose build # will import data file from the resources directory
  docker-compose up # localhost:7000
  ```

### Configuration

- Change DB configuration

  ```
  Modify "paranuara/settings.py" file
  ```

- Change data file
  ```
  Replace files in the "resources/" directory
  
  In docker shell
  python manage.py import_company resources/companies.json -d
  python manage.py import_people resources/people.json -d

  After reset the DB, unittest should be modified accordingly
  ```

### Test

- Unit Test
  ```
  docker-compose exec hivery-paranuara-django-api bash
  python manage.py test
  ```

- curl example
  ```
  curl http://127.0.0.1:7000/v1/api/company/BUGSALL

  curl "http://127.0.0.1:7000/v1/api/people/Moon%20Herring"

  curl "http://127.0.0.1:7000/v1/api/people/Moon%20Herring,Rosemary%20Hayes"
  ```
