FROM ubuntu:16.04

WORKDIR /tmp
RUN apt-get update && \
    apt-get install -y --no-install-recommends wget fontconfig libfontconfig1 libfreetype6 libjpeg-turbo8 libx11-6 libxext6 libxrender1 xfonts-base xfonts-75dpi && \
    wget -q http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb && \
    dpkg -i wkhtmltox-0.12.2.1_linux-trusty-amd64.deb && \
    rm /usr/local/bin/wkhtmltoimage && \
    apt-get purge -y wget && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*
WORKDIR /

ENTRYPOINT ["wkhtmltopdf"]

# Show the extended help
CMD ["-h"]
