# tiltakspenger-pdfgen
PDF generator for tiltakspenger. Kjør lokalt docker image med  `./run_development.sh`

PDFene kan testes lokalt på `http://localhost:8085/api/v1/genpdf/<application>/<template>`, f.eks.
http://localhost:8085/api/v1/genpdf/tpts/vedtakInnvilgelse

Templatene vil bruke flettedata fra json-fil med samme navn som template i `data/tpts`

## Hjelpefunksjoner

https://github.com/navikt/pdfgen/blob/master/src/main/kotlin/no/nav/pdfgen/template/Helpers.kt

### Stor forbokstav

Eksempel `{{capitalize sats}}`

### Kronebeløp

Eksempel `{{currency_no satsBeløp true}}`

Boolean-parameteret angir om beløpet skal avkortes til heltall, altså uten desimaler/øre. Merk at det ikke skjer noen avrunding,
desimalene/ørene fjernes bare.

### Docker hub tags
https://hub.docker.com/r/navikt/pdfgen/tags
