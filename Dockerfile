FROM sameersbn/ubuntu:12.04.20140812
MAINTAINER sameer@damagehead.com

ENV WEBMIN_VERSION 1.690
RUN apt-get update && \
		apt-get install -y --no-install-recommends bind9 perl libnet-ssleay-perl openssl \
			libauthen-pam-perl libpam-runtime libio-pty-perl \
			apt-show-versions python && \
		wget "http://prdownloads.sourceforge.net/webadmin/webmin_${WEBMIN_VERSION}_all.deb" -P /tmp/ && \
		dpkg -i /tmp/webmin_${WEBMIN_VERSION}_all.deb && rm -rf /tmp/webmin_${WEBMIN_VERSION}_all.deb && \
		apt-get clean # 20140625

ADD start /start
RUN chmod 755 /start

EXPOSE 53/udp
EXPOSE 10000
VOLUME ["/data"]
CMD ["/start"]
