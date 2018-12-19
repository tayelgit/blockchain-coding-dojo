## Dezentraler Ticketshop

Der Ticketshop soll um eine weitere Komponente erweitert werden.
Es soll ein Registry Contract entwickelt werden um das Management der Ticketsales zu vereinfachen.

**Funktionale Anforderungen an den Registry Contract sind:**
* Er diehnt als Registry für die Ticketsale contracts.
* Es soll möglich sein per Funktions aufruf einen neuen Ticketsale zu deployen **(achtung: Owner)**
* Alle auf díesem Weg deployten contract sollen demjenigen zugeordnet warden der die “create” Funktion aufgerufen hat.
* Der Registry Contract soll eine Liste *aller* deployed Ticketsales haben.
* Es soll die möglichkeit geben die Liste aller Ticketsales abzufragen.
* Es soll möglich sein eine Liste der Contracts abzufragen von denen man selbst der Owner ist.
