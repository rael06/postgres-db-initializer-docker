# pull official base image
FROM alpine:latest

# Install bash and PostgreSQL client
RUN apk add --no-cache bash postgresql-client

# Copy script to container root
COPY init-data.sh /init-data.sh

# Add this line when the host is a windows machine otherwise the file will not be found
#RUN dos2unix init-data.sh

RUN chmod +x /init-data.sh

# start app
CMD ["/init-data.sh"]
