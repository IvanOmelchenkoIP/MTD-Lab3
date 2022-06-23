FROM python:3.10-alpine

WORKDIR /app/

RUN python -m venv ./.venv
RUN . ./.venv/bin/activate

RUN apk --update add gcc build-base freetype-dev libpng-dev openblas-dev

COPY . /app/
RUN pip install -r ./requirements/backend.in

RUN pip freeze > requirenments.txt
RUN pip install -r requirenments.txt

COPY . /app/

CMD ["uvicorn", "spaceship.main:app", "--host=0.0.0.0", "--port=8080"]
