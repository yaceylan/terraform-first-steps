variable "container_name" {
  description = "Name des Docker-Containers"
  type        = string
  default     = "my-flex-nginx-container"
}

variable "external_port" {
  description = "Externer Port zur Weiterleitung auf Port 80 im Container"
  type        = number
  default     = 8080
}

variable "nginx_html_content" {
  description = "HTML-Inhalt der index.html, die im Container gespeichert wird"
  type        = string
default = "<h1>Hello from Terraform!</h1><p>Willkommen!</p>"
}
