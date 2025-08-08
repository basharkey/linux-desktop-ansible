deps:
	sudo apt install --no-install-recommends -y ansible
	ansible-galaxy install -r requirements.yml
vault:
	ansible-vault encrypt vault.yml
secureboot:
	sudo dkms generate_mok
	sudo mokutil --import /var/lib/dkms/mok.pub
desktop:
	ansible-playbook main.yml -i hosts.yml --ask-become-pass --tags "desktop"
music:
	ansible-playbook main.yml -i hosts.yml --ask-become-pass --extra-vars "override=music" --tags "music"
