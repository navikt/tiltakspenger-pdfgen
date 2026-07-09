# AGENTS.md — tiltakspenger-pdfgen

Dette repoet følger monorepo-konvensjonene i [`../AGENTS.md`](../AGENTS.md) og Kotlin/JVM-backendkonvensjonene i [`../AGENTS-backend.md`](../AGENTS-backend.md). Les disse først.

Lokalt kjører tjenesten på port `8081`, både via metarepoets docker-compose og dette repoets `docker-compose.yml`/`run_development.sh`.
Port 8085 er reservert for `nais login` og skal ikke bindes her.

