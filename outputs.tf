# outputs.tf
output "container_name_output" {
  description = "The name of the created Docker container."
  value       = docker_container.simple_nginx.name
}

output "container_external_port" {
  description = "The external port mapped to the Nginx container."
  value       = docker_container.simple_nginx.ports[0].external
}

output "html_content_used" {
  description = "The HTML content used for the Nginx index page."
  value       = var.nginx_html_content
}