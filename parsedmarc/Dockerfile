FROM python:alpine

RUN apk update && apk upgrade --available
RUN apk add libxml2-dev libxslt-dev 
RUN pip install --no-cache-dir parsedmarc 


COPY ./entrypoint.py /
RUN chmod +x /entrypoint.py

ENTRYPOINT ["/entrypoint.py"]
