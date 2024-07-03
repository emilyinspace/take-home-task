# Using alpine version 3. More tags can be found in https://hub.docker.com/_/alpine/
FROM alpine:3.20.1

# RUN is used at build-time
RUN mkdir -pv /usr/src/app

# Ref: https://docs.python.org/3/using/cmdline.html#envvar-PYTHONUNBUFFERED
ENV PYTHONUNBUFFERED=1

# Install python and pip packages 
RUN apk add --update --no-cache python3 py3-pip

# Specify the working directory
WORKDIR /usr/src/app

# Copy the project to /usr/src/app/
COPY . /usr/src/app

# Create python virtual environment
RUN python3 -m venv .
#ENV PATH="/usr/src/app/bin:$PATH" TODO: delete

# Activate venv to install dependencies
RUN . bin/activate && \
    # TODO: dletewhich python3 && \
    python3 -m pip install -r requirements.txt

# Expose default Flask port
EXPOSE 5000

# CMD is used at run-time
CMD ["/bin/sh", "./entrypoint.sh"]
