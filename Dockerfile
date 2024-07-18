FROM python:3.12-slim

WORKDIR /app

COPY requirement.txt requirement.txt

RUN pip install -r requirement.txt

COPY . /app

EXPOSE 8000
RUN python manage.py migrate && \
    echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', 'password')" | python manage.py shell

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]