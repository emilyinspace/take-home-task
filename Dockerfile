# Using alpine version 3. More tags can be found in https://hub.docker.com/_/alpine/
FROM alpine:3.20.1

# RUN is used at build-time
RUN mkdir -pv /usr/src/app

# Ref: https://docs.python.org/3/using/cmdline.html#envvar-PYTHONUNBUFFERED
ENV PYTHONUNBUFFERED=1

# Install python and pip packages 
RUN apk add --update --no-cache python3 py3-pip

# After python, we proceed with the app
# Specify the working directory
WORKDIR /usr/src/app

# Copy the requirements.txt to install them before running
#COPY requirements.txt /usr/src/app/
COPY . /usr/src/app

RUN python3 -m venv . && \
    echo '~~~~~~~~~~~~~~' && \
    pwd && \
    ls -lhaR /usr/src/ && \
    . ./bin/activate && \
    /usr/src/bin/pip3 install -r requirements.txt

# Expose default Flask port
EXPOSE 5000

# CMD is used at run-time
CMD ["/bin/sh", "./entrypoint.sh"]
