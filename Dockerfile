FROM python:slim

COPY /app /app
WORKDIR /app
ENV FLASK_APP=app.identidock
RUN useradd --create-home user
USER user
ENV PATH="/home/user/.local/bin:$PATH"
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "identidock.py"]