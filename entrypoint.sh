#!/bin/sh

# Set Qdrant's HTTP port to the one assigned by Heroku
export QDRANT__SERVICE__HTTP_PORT="${PORT}"

# You might want to also set the gRPC port if needed,
# though Heroku's web process typically uses one HTTP port.
# If you need gRPC on a different port, Heroku's routing might be complex.
# export QDRANT__SERVICE__GRPC_PORT="SOME_OTHER_PORT_IF_NEEDED"

# Set the path for Qdrant storage (will be ephemeral on Heroku)
export QDRANT__STORAGE__STORAGE_PATH="/qdrant/storage"

# Start Qdrant
exec /qdrant/qdrant
