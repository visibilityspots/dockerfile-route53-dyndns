FROM python:3.12.2-alpine3.19

RUN adduser -S aws
USER aws

COPY r53dyndns.py /usr/local/bin/r53dyndns.py
COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt --no-warn-script-location

ENTRYPOINT [ "/usr/local/bin/r53dyndns.py" ]
CMD [ "--verbose --record $ROUTE53_DOMAIN_A_RECORD" ]
