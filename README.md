# Startet tiltakspenger-pdfgen lokalt
Du kan starte pdfgen lokalt ved å kjøre `docker compose up -d --buld`

Flagget `-d` brukes for at ikke terminalen skal låses til docker.
Flagget `--build` brukes for å bygge imaget på nytt som basicly vil si at applikasjonen som kjøres opp er lik koden du har lokalt.

Pdfgen er også en del av scriptet `up.sh` som ligger i metarepo og starter opp ved kjøring av det.


# Gjøre kall mot tiltakspenger-pdfgen lokalt
PDFene kan testes lokalt på `http://localhost:8081/api/v1/genpdf/<application>/<template>`, f.eks.
http://localhost:8081/api/v1/genpdf/tpts/vedtakInnvilgelse

Templatene vil bruke flettedata fra json-fil med samme navn som template i `data/tpts`


# Gjøre kall mot tiltakspenger-pdfgen lokalt (alternativ 2) 
1. Start opp postman/insomnia/bruno eller et annet program som kan gjøre rest-kall

2. Sett opp en `POST` mot endepunktet du vil ha brev fra f.eks: `http://localhost:8081/api/v1/genpdf/tpts/vedtakInnvilgelse`
3. Sett BODY til å være Json
f.eks:
```
{
  "personalia": {
    "ident": "13548579854",
    "fornavn": "Planet",
    "etternavn": "Planetus"
  },
  "tiltaksnavn": "(tiltaksnavn)",
  "rammevedtakFraDato": "2025-01-01",
  "rammevedtakTilDato": "2025-02-02",
  "saksnummer": "123456",
  "barnetilegg": false,
  "saksbehandlerNavn": "(saksbehandler)",
  "beslutterNavn": "(beslutter)",
  "kontor": "(kontor)",
  "datoForUtsending": "2029-05-10",
  "sats": "285",
  "satsBarn": "53"
}
```

4. Når du har gjort kall må du sette responsen til å tolkes som .PDF eller laste ned responsen som en .PDF-fil


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
