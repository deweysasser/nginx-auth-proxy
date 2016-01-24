FROM nginx
MAINTAINER Dewey Sasser <dewey@sasser.com>

env REALM "Testing Auth"
env SERVICE_PORT 80

COPY nginx.conf /etc/nginx/
WORKDIR /etc/nginx/conf.d/
RUN rm default.conf
COPY default.conf .

COPY htpasswd /etc/nginx/

COPY wrapper.sh /root/wrapper.sh
ENTRYPOINT ["/root/wrapper.sh"]

CMD ["nginx"]
