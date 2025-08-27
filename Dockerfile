# Dockerfile
FROM ghcr.io/navikt/pdfgen:2.0.91

COPY templates /app/templates
COPY fonts /app/fonts
COPY resources /app/resources

ENV ENABLE_HTML_ENDPOINT=false
