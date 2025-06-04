# variables.tf (Korrigierter Inhalt)
variable "container_name" {
  description = "Name for the Nginx Docker container."
  type        = string
  default     = "my-flex-nginx-container"
}

variable "external_port" {
  description = "External port for accessing the Nginx container."
  type        = number
}

variable "nginx_html_content" {
  description = "Content for the index.html file served by Nginx."
  type        = string
  # Der Default-Wert darf keine Variablen-Interpolation enthalten
  default     = "<h1>Hello from Terraform Default!</h1><p>This is the initial content.</p>"
}