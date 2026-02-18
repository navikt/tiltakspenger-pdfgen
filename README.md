# tiltakspenger-pdfgen
Generering av PDF for tiltakspenger sine applikasjoner.

## Starte tiltakspenger-pdfgen lokalt
* Du kan starte pdfgen lokalt ved å kjøre `./run_development.sh` 

* Man kan også kjøre docker-compose:
```docker compose up -d --build```

    Flagget `-d` brukes for at ikke terminalen skal låses til docker.
Flagget `--build` brukes for å bygge imaget på nytt som vil si at applikasjonen som kjøres opp er lik koden du har lokalt.

* Pdfgen er også en del av scriptet `up.sh` som ligger i metarepo og starter opp ved kjøring av det.


## Gjøre kall mot tiltakspenger-pdfgen lokalt
PDFene kan testes lokalt på `http://localhost:8085/api/v1/genpdf/<application>/<template>`, f.eks.
http://localhost:8085/api/v1/genpdf/tpts/vedtakInnvilgelse

Templatene vil bruke flettedata fra json-fil med samme navn som template i `data/tpts`


## Gjøre kall mot tiltakspenger-pdfgen lokalt (alternativ 2) 
1. Start opp postman/insomnia/bruno eller et annet program som kan gjøre rest-kall

2. Sett opp en `POST` mot endepunktet du vil ha brev fra f.eks: `http://localhost:8085/api/v1/genpdf/tpts/vedtakInnvilgelse`
3. Sett BODY til å være Json
f.eks:
```
{
  "personalia": {
    "ident": "50485211165",
    "fornavn": "Ola",
    "etternavn": "Nordmann"
  },
  "saksnummer": "202501301001",
  "saksbehandlerNavn": "Saksbehandler Navn",
  "beslutterNavn": "Saksbehandler Navn",
  "kontor": "Nav Tiltakspenger",
  "harBarnetillegg": true,
  "satser": [
    {
      "år": 2024,
      "ordinær": 285,
      "barnetillegg": 53
    },
    {
      "år": 2025,
      "ordinær": 298,
      "barnetillegg": 55
    }
  ],
  "tilleggstekst": "Dette er en vurdering",
  "forhandsvisning": true,
  "datoForUtsending": "31. januar 2025",
    "innvilgelsesperioder": {
    "antallDagerTekst": "fem dager",
    "perioder": [
      {
        "fraOgMed": "1. november 2024",
        "tilOgMed": "28. februar 2025"
      }
    ]
  },
  "barnetillegg": [
    {
      "antallBarnTekst": "ett",
      "periode": {
        "fraOgMed": "1. november 2024",
        "tilOgMed": "28. februar 2025"
      }
    }
  ]
}
```

4. Når du har gjort kall må du sette responsen til å tolkes som .PDF eller laste ned responsen som en .PDF-fil


## Hjelpefunksjoner

https://github.com/navikt/pdfgen-core/blob/main/src/main/kotlin/no/nav/pdfgen/core/template/Helpers.kt

### Stor forbokstav

Eksempel `{{capitalize sats}}`

### Kronebeløp

Eksempel `{{currency_no satsBeløp true}}`

Boolean-parameteret angir om beløpet skal avkortes til heltall, altså uten desimaler/øre. Merk at det ikke skjer noen avrunding,
desimalene/ørene fjernes bare.

### Docker hub tags
https://hub.docker.com/r/navikt/pdfgen/tags
