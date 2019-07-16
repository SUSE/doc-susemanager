FROM opensuse/leap:latest
MAINTAINER Joseph Cayouette "jcayouette@suse.com"

# Add rbenv and ruby deps
ADD add_deps.sh /root/add_deps.sh
RUN /root/add_deps.sh

# Install rbenv and ruby-build
RUN git clone https://github.com/rbenv/rbenv.git /root/.rbenv
RUN git clone https://github.com/rbenv/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN ./root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /root/.bashrc
RUN echo 'export PATH="/root/.rbenv/bin:$PATH"' >> /root/.bashrc
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile

# Install Ruby
ENV CONFIGURE_OPTS --disable-install-doc
ADD versions.txt /root/versions.txt
RUN xargs -L 1 rbenv install < /root/versions.txt
RUN rbenv global 2.6.3
RUN bash -c -l 'gem install asciidoctor'
RUN bash -c -l 'gem install asciidoctor-pdf -v 1.5.0.alpha.18'

# Add NVM and NODE LTS
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
RUN echo export NVM_DIR="/root/.nvm" >> /root/.bashrc
RUN source /root/.bashrc
COPY uid-number.js /usr/lib64/node_modules/npm10/node_modules/uid-number/
RUN bash -c -l nvm install --lts
RUN npm i -g yarn
RUN yarn global add @antora/cli@2.0
RUN yarn global add @antora/site-generator-default@2.0

WORKDIR /workspace

# Add the build script
#ADD run.sh /root/run.sh
#CMD /root/run.sh