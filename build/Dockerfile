FROM python:3-alpine

RUN pip install --upgrade pip

RUN adduser -D worker
USER worker

WORKDIR /home/worker

COPY --chown=worker:worker build/requirements.txt requirements.txt
RUN pip install --user -r requirements.txt

ENV PATH="/home/worker/.local/bin:${PATH}"

WORKDIR /home/worker/app

COPY --chown=worker:worker app/ /home/worker/app

LABEL maintainer="Fernando Constantino <github.com/ferdn4ndo>" \
      version="1.0.0"

ENTRYPOINT [ "./entrypoint.sh" ]
