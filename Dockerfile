FROM qdrant/qdrant:latest AS base

EXPOSE 6333
EXPOSE 6334
EXPOSE 6335

CMD ["./qdrant"]
