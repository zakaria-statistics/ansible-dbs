ansible-playbook -i inventory.ini playbooks/pg_install.yml
ansible-playbook -i inventory.ini playbooks/pg_users.yml
ansible-playbook -i inventory.ini playbooks/pg_backup.yml