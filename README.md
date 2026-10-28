# Sjakk mot datamaskinen

Statisk html side, med et minispill som du kan spille sjakk i mot datamaskinen på.

   ![Et parti sjakk i nettleseren](Project-screenshots/sjakkside.png)

## Hva gjør nettsiden?

En enkel webserver som leverer index.html, nettleseren henter bibliotekene; jQuery, chess.js, chessboard.js og Stockfish-API-et selv. 
Siden Stockfish er et tredjeparts API og er eksternt kan det være nede.

## Hvordan starte og gå inn på nettsiden

Kjør "python3 -m http.server 8080". 
Velg porter i menyen ved siden av terminalen og velg jordkloden bak port 8080 og åpne i nettleser. 

## Hva jeg lærte

Jeg hentet koden først med hjelp fra Google AI. Der fungerte ikke siden når jeg kjørte "python3 -m http.server 8080"
Ved å inspisere siden med f12 så jeg at nettleseren ikke kunne hente skriptet, så feilen måtte være i koden fra min side.
Jeg prøvde å omgå problemet ved å laste ned filene manuelt. Dette fungerte heller ikke.

Etter å ha inspisert siden med f12, så jeg at det var et html dokument. Filene mine var i .js men innholdet var html og siden linkene var forkortet pekte de på en nettside i stedet for et rent javascript.
Ved å erstatte de med de riktige linkene fungerte det fint, og jeg kan spille sjakk.

## Hva er planen videre?

Jeg skal nå deploye den statiske nettsiden til Azure, opprettet med Terraform.
