FROM python:3-alpine

ENV AWS_ACCESS_KEY_ID \
    AWS_SECRET_ACCESS_KEY \
    ROUTE53_DOMAIN_A_RECORD

RUN adduser -S aws

USER aws

COPY r53dyndns.py /usr/local/bin/r53dyndns.py
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt --no-warn-script-location

ENTRYPOINT ["entrypoint.sh"]
