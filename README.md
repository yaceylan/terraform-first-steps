Terraform Erste Schritte: Dynamische Docker-Bereitstellung
Dieses Repository dokumentiert meine ersten Schritte mit Terraform zur Provisionierung einer Docker-Umgebung. Das Hauptziel war die Erstellung eines NGINX-Containers und die dynamische Anpassung seines HTML-Inhalts mithilfe von Terraform-Variablen. Ich habe erfolgreich eine Terraform-Konfiguration mit dem kreuzwerker/docker Provider erstellt, docker_image und docker_container Ressourcen definiert und Werte über eine .tfvars-Datei (z.B. für Containername, Port, HTML-Inhalt) übergeben. Den vollständigen Terraform-Workflow (init, plan, apply, destroy) habe ich durchlaufen und einen local-exec Provisioner genutzt, um benutzerdefiniertes HTML in den laufenden Container zu injizieren. Die bereitgestellte NGINX-Seite habe ich lokal im Browser unter http://localhost:8888 getestet und alle erstellten Ressourcen samt Docker-Image sauber entfernt.

Die wichtigsten Konfigurationsdateien sind main.tf (Provider, Ressourcen, Provisioner), variables.tf (Variablendefinitionen), outputs.tf (Ausgabewerte) und test.tfvars (Beispiel für Variablenwerte).

Um den Workflow auszuführen, navigieren Sie ins Projektverzeichnis und nutzen Sie folgende Befehle:

Initialisieren: terraform init
Planen: terraform plan -var-file="test.tfvars"
Anwenden: terraform apply -var-file="test.tfvars"
Testen im Browser: Öffnen Sie http://localhost:8888
Ressourcen zerstören: terraform destroy -var-file="test.tfvars"
Docker-Image manuell löschen (optional): docker image rm nginx:latest
Die .gitignore-Datei stellt sicher, dass generierte Dateien (.terraform/, terraform.tfstate*) und sensible Variablen (*.tfvars) nicht im Versionskontrollsystem abgelegt werden.