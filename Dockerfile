FROM python:3.10

COPY /app /app
WORKDIR /app
ENV FLASK_APP=app.identidock
RUN useradd --create-home user
USER user
ENV PATH="/home/user/.local/bin:$PATH"
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# initialize app from identidock, http server listen 9090, watcher server on 9091
CMD ["uwsgi", "--http", "0.0.0.0:9090", "--wsgi-file", "/app/identidock.py", "--callable", \
     "app", "--stats", "0.0.0.0:9191"]