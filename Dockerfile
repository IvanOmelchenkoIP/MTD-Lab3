FROM python:3.10-buster

WORKDIR /app/

COPY . /app/

RUN python -m venv ./.venv

RUN . ./.venv/bin/activate

RUN pip freeze > requirenments.txt

RUN pip install -r requirenments.txt

RUN pip install -r ./requirements/backend.in

COPY . /app/

CMD ["uvicorn", "spaceship.main:app", "--host=0.0.0.0", "--port=8080"]