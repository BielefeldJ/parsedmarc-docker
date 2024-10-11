FROM python:alpine

RUN apk update && apk upgrade --available
RUN apk add --no-cache libxml2-dev libxslt-dev 
RUN pip install --no-cache-dir parsedmarc 
# Remove apk configs.
RUN find /bin /etc /lib /sbin /usr \
 -xdev -type f -regex '.*apk.*' \
 ! -name apk \
 -exec rm -fr {} +

COPY ./entrypoint.py /
RUN chmod +x /entrypoint.py

ENTRYPOINT ["/entrypoint.py"]
