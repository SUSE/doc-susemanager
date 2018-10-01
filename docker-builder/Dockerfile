# DAPS "Docbook Authoring and Publishing Suite" doc-builder container
#
# VERSION               0.0.1

FROM opensuse/leap:latest
MAINTAINER Joseph Cayouette "jcayouette@suse.de"

# Add the repositories
ADD add_repositories.sh /root/add_repositories.sh
RUN /root/add_repositories.sh

# Add the daps packages
ADD add_packages.sh /root/add_packages.sh
RUN /root/add_packages.sh

# Add the dapsrc
#ADD dapsrc /root/.config/daps/dapsrc

# Add Ruby and asciidoctor
ADD add_ruby.sh /root/add_ruby.sh
RUN /root/add_ruby.sh


WORKDIR /workspace

# Add the build script
ADD run.sh /root/run.sh
CMD /root/run.sh

#RUN useradd -ms /bin/bash daps
#USER daps
