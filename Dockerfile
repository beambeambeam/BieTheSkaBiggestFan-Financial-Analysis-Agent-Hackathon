# Use the official Qdrant image
FROM qdrant/qdrant:latest

# Heroku exposes the port via the PORT environment variable
# Qdrant's default gRPC port is 6334 and HTTP port is 6333.
# We will use the HTTP port for Heroku's web process.
# The entrypoint script will handle setting the correct Qdrant port.

# Create a directory for Qdrant data (though on Heroku, this will be ephemeral)
RUN mkdir -p /qdrant/storage

# Set the working directory
WORKDIR /qdrant

# Create a custom entrypoint script to read Heroku's PORT variable
# and start Qdrant on that port.
COPY entrypoint.sh /qdrant/entrypoint.sh
RUN chmod +x /qdrant/entrypoint.sh

# Expose the default Qdrant ports (informational, Heroku uses PORT env var)
EXPOSE 6333
EXPOSE 6334

# Set the custom entrypoint
ENTRYPOINT ["/qdrant/entrypoint.sh"]

# The CMD from the base Qdrant image will be used by default if not overridden
# or if the entrypoint doesn't call it.
# The base image CMD is typically ["./qdrant"]
