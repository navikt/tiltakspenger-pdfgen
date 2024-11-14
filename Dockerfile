# Dockerfile
FROM ghcr.io/navikt/pdfgen:2.0.57

COPY templates /app/templates
COPY fonts /app/fonts
COPY resources /app/resources

ENV ENABLE_HTML_ENDPOINT=true
