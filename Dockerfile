FROM python:3.10

COPY /app /app
COPY cmd.sh /
WORKDIR /app

RUN groupadd -r uwsgi && useradd -r --create-home -g uwsgi uwsgi
USER uwsgi
ENV PATH="/home/uwsgi/.local/bin:$PATH"
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

ENV FLASK_APP=app.identidock
# initialize app from identidock, http server listen 9090, watcher server on 9091
CMD ["/cmd.sh"]