ARG BUILD_FROM=alpine:latest
FROM $BUILD_FROM

# Install required packages
RUN apk add --no-cache inotify-tools jq

# Set working directory
WORKDIR /app

# Copy files
COPY run.sh /
COPY .env /app/
RUN chmod a+x /run.sh

# Define volume
VOLUME /homeassistant

CMD ["sh", "/run.sh"]