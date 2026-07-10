# AGENTS.md — tiltakspenger-pdfgen

Dette repoet følger monorepo-konvensjonene i [`../AGENTS.md`](../AGENTS.md) og Kotlin/JVM-backendkonvensjonene i [`../AGENTS-backend.md`](../AGENTS-backend.md). Les disse først.

Lokalt kjører tjenesten på port `8081`, både via metarepoets docker-compose og dette repoets `docker-compose.yml`/`run_development.sh`.
Port 8085 er reservert for `nais login` og skal ikke bindes her.

Testdataene i `data/tpts/` bruker samme kanoniske testfamilie som `tiltakspenger-pdfgenrs` (Emil Aremark m/familie, Ingrid Bakke, Martin Holm, saksnummer `202501011001`) — se testdata-avsnittet i [`../tiltakspenger-pdfgenrs/AGENTS.md`](../tiltakspenger-pdfgenrs/AGENTS.md).
Datafilene skal hete det samme som malen (`<mal>.hbs` ↔ `data/tpts/<mal>.json`), ellers finner ikke pdfgen dem.
