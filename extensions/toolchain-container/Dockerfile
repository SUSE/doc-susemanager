FROM opensuse/leap:latest
MAINTAINER Joseph Cayouette "jcayouette@suse.com"

# Add rbenv and ruby deps
ADD add_deps.sh /root/add_deps.sh
RUN /root/add_deps.sh

# Install rbenv and ruby-build
RUN git clone https://github.com/rbenv/rbenv.git /root/.rbenv
RUN git clone https://github.com/rbenv/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN /root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh # or /etc/profile
RUN echo 'eval "$(rbenv init -)"' >> .bashrc
RUN source /etc/profile.d/rbenv.sh

# Install multiple versions of ruby
ENV CONFIGURE_OPTS --disable-install-doc
ADD ./versions.txt /root/versions.txt
RUN xargs -L 1 rbenv install < /root/versions.txt
RUN gem update --system
RUN rbenv global 2.6.3
# testing username

# Add Ruby 2.6.3
#ADD add_ruby.sh /root/add_ruby.sh
#RUN /root/add_ruby.sh

# Add NVM and NODE LTS
#ADD add_nvm_node_lts.sh /root/add_nvm_node_lts.sh
#RUN /root/add_nvm_node_lts.sh

# Add the toolchain packages (Asciidoctor, Asciidoctor-pdf, antora)
#ADD add_packages.sh /root/add_packages.sh
#RUN /root/add_packages.sh

WORKDIR /workspace

# Add the build script
ADD run.sh /root/run.sh
CMD /root/run.sh