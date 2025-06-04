## Terraform Erste Schritte: Dynamische Docker-Bereitstellung

Dieses Repository dokumentiert meine ersten Schritte mit Terraform zur Provisionierung einer Docker-Umgebung. Ziel war es, einen NGINX-Container bereitzustellen und den HTML-Inhalt dynamisch über Terraform-Variablen anzupassen.

Ich habe eine Terraform-Konfiguration mit dem `kreuzwerker/docker` Provider erstellt, `docker_image` und `docker_container` Ressourcen definiert und Werte über eine `.tfvars`-Datei (z. B. Containername, Port, HTML-Inhalt) eingebunden. Der komplette Workflow (`init`, `plan`, `apply`, `destroy`) wurde erfolgreich durchlaufen. Ein `local-exec` Provisioner sorgt dafür, dass der benutzerdefinierte HTML-Inhalt in den laufenden Container kopiert wird. Die NGINX-Seite wurde lokal im Browser unter `http://localhost:8888` getestet. Alle Ressourcen und das verwendete Docker-Image wurden am Ende wieder entfernt.

### Wichtige Dateien

- `main.tf`: enthält Provider, Ressourcen und Provisioner
- `variables.tf`: definiert die Eingabevariablen
- `outputs.tf`: zeigt wichtige Ausgabewerte wie Port und Containername
- `test.tfvars`: Beispiel für konkrete Variablenwerte

### Struktur der test.tfvars

```hcl
nginx_container_name = "mein-nginx"
nginx_host_port      = 8888
nginx_html_content   = "<h1>Hallo von Terraform!</h1>"
Workflow
So führst du das Projekt aus:

bash
Kopieren
Bearbeiten
terraform init
terraform plan -var-file="test.tfvars"
terraform apply -var-file="test.tfvars"
# Im Browser öffnen:
# http://localhost:8888
terraform destroy -var-file="test.tfvars"
# Optional: Docker-Image entfernen
docker image rm nginx:latest
Screenshots
Die wichtigsten Screenshots wurden im Ordner screenshots/ abgelegt. Sie dokumentieren:

Den erfolgreichen Output von terraform apply

Den Aufruf von http://localhost:8888 im Browser mit angepasstem HTML

Den Output von terraform destroy


Hinweise
In der .gitignore sind .terraform/, terraform.tfstate* und *.tfvars eingetragen, damit keine sensiblen oder generierten Dateien ins Git-Repo gelangen.