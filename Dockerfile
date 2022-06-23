FROM python:3.10-buster

WORKDIR /app/

RUN python -m venv ./.venv
RUN . ./.venv/bin/activate

COPY . /app/
RUN pip install -r ./requirements/backend.in

RUN pip freeze > requirenments.txt
RUN pip install -r requirenments.txt

COPY . /app/

CMD ["uvicorn", "spaceship.main:app", "--host=0.0.0.0", "--port=8080"]
