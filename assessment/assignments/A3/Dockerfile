# Using lightweight alpine image
FROM python:3.8-alpine

# Installing packages
RUN apk update
#RUN apk add python3-pip

# Defining working directory and adding source code
WORKDIR /usr/src/app
COPY bootstrap.sh ./
COPY A3 ./A3

# Install API dependencies
RUN pip install flask
#RUN pip install --system --deploy

# Start app
EXPOSE 5000
ENTRYPOINT ["/usr/src/app/bootstrap.sh"]
