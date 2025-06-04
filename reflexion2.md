## Refexion

1.  **Was hat der Befehl `terraform apply` getan, als du ihn zum ersten Mal mit deiner initialen Konfiguration (ohne Variablen) ausgeführt hast?**

    Beim ersten Ausführen von `terraform apply` wurde die Infrastruktur basierend auf der Konfiguration erstellt. Konkret bedeutete das: Terraform hat ein Docker-Image (`nginx:latest`) heruntergeladen und einen Container darauf basierend gestartet. Dabei wurden alle Werte, wie Containername oder Port, fest im Code definiert (nicht über Variablen gesteuert).

2.  **Was ist mit dem Terraform State (`terraform.tfstate`) passiert, nachdem du `terraform apply` und `terraform destroy` ausgeführt hast?**

    Nach `terraform apply` wurde die Datei `terraform.tfstate` erstellt bzw. aktualisiert. Sie enthält den aktuellen Zustand der Infrastruktur, damit Terraform Änderungen erkennen und verwalten kann. Nach `terraform destroy` wurde die Infrastruktur gelöscht – die `terraform.tfstate` blieb erhalten, aber zeigte jetzt, dass keine Ressourcen mehr vorhanden sind.

3.  **Wie haben die Variablen (`variable {}`, `var.`) deine Konfiguration flexibler und wiederverwendbarer gemacht, verglichen mit der initialen Konfiguration (ohne Variablen)?**

    Durch Variablen konnte ich die Konfiguration flexibel gestalten: statt feste Werte im Code zu verwenden, wurden Containername, Port und HTML-Inhalt dynamisch gesetzt. So lässt sich dieselbe Terraform-Datei mit unterschiedlichen Werten mehrfach verwenden – ideal für Test-, Entwicklungs- oder Produktionsumgebungen.

4.  **Auf welche drei Arten hast du Werte an deine Input-Variablen übergeben? Beschreibe kurz die Methode und ihre Priorität.**

    * **Standardwert (`default`) in der `variables.tf`**: Wird verwendet, wenn kein anderer Wert angegeben wird (niedrigste Priorität).
    * **Direkt über die Kommandozeile (`-var`)**: z. B. `terraform apply -var="container_name=my-container"`. Höhere Priorität als `default`.
    * **Per Variablen-Datei (`-var-file`)**: z. B. `terraform apply -var-file="test.tfvars"`. Diese Methode ist übersichtlich, wenn viele Werte gesetzt werden sollen – sie hat Priorität über `default`, aber unterhalb direkter `-var`-Angaben.

    **Prioritätsreihenfolge (von niedrig nach hoch):**
    `default` < `-var-file` < `-var`

5.  **Was zeigen die Outputs (`output {}`, `terraform output`) an, nachdem du apply ausgeführt hast? Wofür sind sie nützlich?**

    Nach `terraform apply` zeigen `terraform output`-Definitionen z. B. den Container-Namen, den externen Port oder den verwendeten HTML-Inhalt. Sie machen wichtige Informationen sichtbar, ohne in die `.tfstate`-Datei schauen zu müssen. Besonders nützlich sind sie zur Weiterverarbeitung durch Skripte oder zur Dokumentation.

6.  **Wie hast du den Inhalt der Variable `nginx_html_content` in die `index.html`-Datei im laufenden Docker-Container bekommen? Welche Terraform-Funktion (Provisioner) wurde dafür genutzt?**

    Ich habe den Inhalt über einen `local-exec` Provisioner mit einem PowerShell-Skript in eine temporäre Datei geschrieben. Diese wurde dann mit docker cp in den Container in den Pfad /usr/share/nginx/html/index.html kopiert.