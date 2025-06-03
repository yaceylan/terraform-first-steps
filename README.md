# Terraform Erste Schritte 

Dieses Repository enthält meine ersten praktischen Schritte mit Terraform. Ziel war es, eine einfache Terraform-Konfiguration zu erstellen, die einen Provider und Ressourcen für eine Docker-Umgebung definiert, und die grundlegenden Terraform-Befehle (`terraform init`, `terraform plan`) auszuführen.

## Aufgabenübersicht

Die Hauptziele dieser Aufgabe waren:
1.  Eine minimale Terraform-Konfiguration zu erstellen.
2.  Den `docker` Provider zu definieren und zu konfigurieren.
3.  Eine `docker_image` und eine `docker_container` Ressource zu definieren.
4.  Den Terraform-Workflow mit `terraform init` und `terraform plan` auszuführen und deren Output zu verstehen.

## Projektstruktur

Alle Dateien für diese Terraform-Aufgabe befinden sich in diesem Repository-Wurzelverzeichnis.



resource "docker_container" "simple_nginx_container" {
  name  = "my-nginx-container"
  image = docker_image.nginx_image.name # Implizite Abhängigkeit
}

