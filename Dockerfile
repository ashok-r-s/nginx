# Define Ubuntu version as build argument

ARG VERSION=22.04

# Use the argument in the base image

FROM ubuntu:${VERSION}

# Install required packages

RUN apt-get update && \

    apt-get install -y --no-install-recommends \

    curl \

    nginx && \

    apt-get clean && \

    rm -rf /var/lib/apt/lists/*

# Expose port 80 for web traffic

EXPOSE 80

# Start nginx in foreground

ENTRYPOINT ["nginx", "-g"]

CMD ["daemon off;"]
