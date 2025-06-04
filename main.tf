resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "simple_nginx" {
  name  = var.container_name
  image = docker_image.nginx.name


  ports {
    internal = 80
    external = var.external_port
  }

  provisioner "local-exec" {
    interpreter = ["powershell", "-Command"]
    command     = <<EOT
Start-Sleep -Seconds 5;
$htmlContent = "${var.nginx_html_content}";
$tempFilePath = Join-Path $env:TEMP "index.html";
Set-Content -Path $tempFilePath -Value $htmlContent -Encoding UTF8;
docker cp "$tempFilePath" "${docker_container.simple_nginx.name}:/usr/share/nginx/html/index.html";
Remove-Item -Path $tempFilePath;
EOT
  }
}
