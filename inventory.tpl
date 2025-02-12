all:
  hosts:
%{ for ip in aws_instance.servers[*].public_ip ~}
    server-${index(ip)}:
      ansible_host: ${ip}
      ansible_user: ec2-user
      ansible_ssh_private_key_file: ~/.ssh/terraform.pem
%{ endfor ~}
