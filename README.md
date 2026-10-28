# Sjakk mot datamaskinen

## Statisk html side, med et minispill som du kan spille sjakk i mot datamaskinen på.

   ![Et parti sjakk i nettleseren](Project-screenshots/sjakkside.png)

## Hva gjør nettsiden?

En enkel webserver som leverer index.html, nettleseren henter bibliotekene; jQuery, chess.js, chessboard.js og Stockfish-API-et selv. Siden Stockfish er et tredjeparts API og er eksternt kan det være nede.

## Hvordan starte og gå inn på nettsiden

Kjør "python3 -m http.server 8080" velg porter i menyen ved siden av terminalen, og velg jordkloden bak port 8080, så åpne i nettleser. 

## Hva jeg lærte

Jeg hentet koden først fra Google AI. Der fungerte ikke siden når jeg kjørte "python3 -m http.server 8080"
Ved å inspisere siden med f12 så jeg at nettleseren ikke kunne hente skriptet så feilen måtte være i koden fra min side.
Det fungerte heller ikke å laste ned pakkene manuelt og legge de inn i prosjektet og kjøre de der i fra. 

Det viste seg at jeg trengte de helt spesifikke linkene til pakkene, siden Google AI hadde lagt inn forkortede domenenavn, så siden min kjørte en html side i stedet for et skript, det samme skjedde når jeg prøvde å laste ned filene manuelt i JSON filer. Ved å erstatte de med de riktige linkene fungerte det fint, og jeg kan spille sjakk.

## Hva er planen videre?

Jeg skal nå deploye sden statiske nettsiden til Azure, opprettet med Terraform!
