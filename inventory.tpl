[ClusterManager]
ClusterManager ansible_host=${splunk_public_ips["ClusterManager"]} ansible_user=ec2-user

[indexers]
%{ for name in keys(splunk_public_ips) ~}
%{ if startswith(name, "indexer") }
${name} ansible_host=${splunk_public_ips[name]} ansible_user=ec2-user
%{ endif }
%{ endfor ~}

[search_heads]
%{ for name in keys(splunk_public_ips) ~}
%{ if startswith(name, "search_head") }
${name} ansible_host=${splunk_public_ips[name]} ansible_user=ec2-user
%{ endif }
%{ endfor ~}
