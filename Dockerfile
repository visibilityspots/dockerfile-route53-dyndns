FROM python:3.12.2-alpine3.19


COPY r53dyndns.py /usr/local/bin/r53dyndns
RUN chmod +x /usr/local/bin/r53dyndns

RUN adduser -S aws
USER aws

COPY requirements.txt requirements.txt
RUN pip3 install --user -r requirements.txt --no-warn-script-location

ENTRYPOINT [ "/usr/local/bin/r53dyndns" ]
CMD [ "--verbose --record $ROUTE53_DOMAIN_A_RECORD" ]
