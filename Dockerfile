FROM grahamdumpleton/mod-wsgi-docker:python-3.5-onbuild

RUN apt-get update
RUN apt-get -y install unzip

WORKDIR /app
RUN curl -LO https://github.com/zimeon/iiif/archive/develop.zip
RUN unzip develop
RUN mv iiif-develop iiif

WORKDIR /app/iiif/testimages
RUN rm -rf *
ADD images/* /app/iiif/testimages/
ADD iiif_reference_server.cfg /app/iiif/

CMD [ "iiif/iiif_reference_server.wsgi" ]
