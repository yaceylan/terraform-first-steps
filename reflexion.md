# Reflexion 

## Was ist die Rolle des provider Blocks in deiner Konfiguration?
Der `provider`-Block teilt Terraform mit, mit welchem externen Dienst (hier: Docker) es interagieren soll.

## Warum ist er notwendig?
Er ist notwendig, weil Terraform spezifische Anweisungen und Tools benötigt, um mit der API des jeweiligen Anbieters (wie Docker) kommunizieren und dessen Ressourcen verwalten zu können.

## Was ist die Rolle des resource Blocks?
Der `resource`-Block definiert eine bestimmte Infrastrukturkomponente, die Terraform erstellen, ändern oder löschen soll (z.B. ein Docker Image oder ein Docker Container).

## Was repräsentiert er im Vergleich zu einem provider?
Im Vergleich zum `provider`, der die allgemeine Verbindung zum Dienst herstellt, repräsentiert die `resource` eine konkrete Instanz oder ein konkretes Element dieser Infrastruktur.

## Wie hast du in deiner Konfiguration eine implizite Abhängigkeit zwischen der docker_container Ressource und der docker_image Ressource erstellt?
Ich habe im `docker_container`-Block das `image`-Argument verwendet, um direkt auf den Namen des `docker_image` zu verweisen (`image = docker_image.nginx_image.name`).

## Warum ist es wichtig, dass Terraform diese Abhängigkeit versteht?
Es ist wichtig, damit Terraform die Ressourcen in der richtigen Reihenfolge erstellt (Image vor Container), um Fehler bei der Bereitstellung zu vermeiden.

## Was genau bewirkt der Befehl terraform init, wenn du ihn zum ersten Mal in einem Verzeichnis ausführst?
`terraform init` initialisiert das Arbeitsverzeichnis, indem es die erforderlichen Provider-Plugins herunterlädt und das Backend für die Speicherung des Infrastruktur-Zustands einrichtet.

## Was genau zeigt der Output von terraform plan an?
Der Output von `terraform plan` zeigt eine detaillierte Vorschau der Änderungen, die Terraform an der Infrastruktur vornehmen würde.

## Welche Informationen liefert er, bevor du die Infrastruktur tatsächlich erstellst?
Er listet genau auf, welche Ressourcen hinzugefügt (`+`), geändert (`~`) oder gelöscht (`-`) würden und welche Attribute dabei betroffen sind.