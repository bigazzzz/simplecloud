default:
	ansible-playbook --vault-password-file=.vault_password -i hosts.yml simplecloud.playbook.yml
vault_password:
	echo "Enter password: "
	ansible-vault encrypt_string --vault-password-file=.vault_password 
vault:
	cp -f .vault_file hosts.yml
	ansible-vault encrypt --vault-password-file=.vault_password hosts.yml
