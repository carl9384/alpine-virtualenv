FROM alpine:3.7

RUN apk add  \
    python3-dev \
    vim \
    bash \
  && ln -s $(which python3) /usr/bin/python \
  && ln -s $(which pip3) /usr/bin/pip \
  && pip install pip --upgrade \
  && pip install virtualenvwrapper

RUN echo \
  "source /usr/bin/virtualenvwrapper.sh > /dev/null 2>&1" > /root/.bashrc \
  && /bin/bash -c "source /root/.bashrc; mkvirtualenv app" \
  && echo "workon app" >> /root/.bashrc

RUN mkdir /app
WORKDIR /app

CMD /bin/bash
