output "instance_public_ip" {
  value = aws_instance.ubuntu_web.public_ip
}

output "ssh_command" {
  value = "ssh -i ../secrets/proj-key.pem ubuntu@${aws_instance.ubuntu_web.public_ip}"
}
