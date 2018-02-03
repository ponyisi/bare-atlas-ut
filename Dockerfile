## University of Texas - Austin configuration
## Condor and local squid - no autodiscovery

FROM cern/slc6-base
MAINTAINER Peter Onyisi "ponyisi@cern.ch"

# Frontier configuration
ENV ALRB_localConfigDir /root/localConfig

# install HEP base libraries
# Install Condor
ADD etc-yum-htcondor.repo /etc/yum.repos.d/htcondor-stable.repo
ADD condor_config.local /etc/condor/condor_config.local

# Install ganglia
RUN touch /var/lib/rpm/* ; yum -y install http://linuxsoft.cern.ch/cern/slc64/x86_64/yum/extras/HEP_OSlibs_SL6-1.1.2-1.el6.x86_64.rpm condor wget rsync nano sudo ganglia-gmond ; yum clean all
ADD etc-ganglia-gmond.conf /etc/ganglia/gmond.conf

ADD localFrontierSquid.sh /root/localConfig/localFrontierSquid.sh

ADD startcondor.sh /root/startcondor.sh
ADD start.sh /root/start.sh
ADD etc-fuse.conf /etc/fuse.conf

RUN chmod uga+rx /root/startcondor.sh /root/start.sh
RUN usermod -a -G fuse nobody

ENTRYPOINT /root/start.sh
