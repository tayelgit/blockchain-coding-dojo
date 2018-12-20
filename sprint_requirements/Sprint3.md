## Dezentraler Ticketshop

Der Ticketshop soll um eine weitere Komponente erweitert werden.
Es soll ein Registry Contract entwickelt werden um das Management der Ticketsales zu vereinfachen.

**Funktionale Anforderungen an den Registry Contract sind:**
* Er dient als Registry für die Ticketsale Contracts.
* Es soll möglich sein per Funktionsaufruf einen neuen Ticketsale zu deployen. **(Achtung: Owner)**
* Alle auf diesem Weg deployten Contracts sollen demjenigen zugeordnet werden, der die “create” Funktion aufgerufen hat.
* Der Registry Contract soll eine Liste *aller* deployten Ticketsales haben.
* Es soll die Möglichkeit geben die Liste aller Ticketsales abzufragen.
* Es soll möglich sein eine Liste der Contracts abzufragen von denen man selbst der Owner ist.
