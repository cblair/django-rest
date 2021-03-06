FROM python:3.9.9
ENV PYTHONUNBUFFERED=1
WORKDIR /code
# COPY requirements/* /code/requirements/
# COPY requirements.txt /code/
COPY . /code/
# RUN python3 -m pip install --upgrade pip
RUN pip3 install -r /code/requirements.txt
RUN python3 /code/manage.py makemigrations 
# Can't migrate here with postgresl (no db host), must do on startup
# RUN python3 /code/manage.py migrate