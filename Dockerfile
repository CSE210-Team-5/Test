# syntax=docker/dockerfile:1

FROM python:3.11

WORKDIR /code

COPY . .
RUN pip install -U pip setuptools wheel
RUN pip install pdm

RUN pdm init -gn &&\
    pdm install

EXPOSE 50505

ENTRYPOINT ["pdm","run","gunicorn", "-b", "0.0.0.0:50505","feed_amalgamator.__init__:create_app()"]
