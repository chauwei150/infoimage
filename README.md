# interview

🔹 Part 1: Provisioning with Terraform/Terragrunt
Task:  Write a Terragrunt configuration that provisions a Linux VM on vCenter.  The VM should:
o Be provisioned with a IP 10.10.10.9.
o Netqork_name: VLAN10
o Use “linux-ubuntu-24.04” as template
Deliverables:  Terragrunt code (preferable) or Terraform code.  README with the required variables and steps to run. 🔹 Part 2: VM Customization with Ansible
Task:  Write an Ansible playbook that does the following on the provisioned VM:
o Installs:  Datadog Agent  Docker  Docker Compose
o Creates a user operations with sudo permissions.
o Configures /etc/fstab to mount the following NFS share:
10.10.10.10:/dev/utils → /mnt/utils
o Ensures /mnt/utils is created and mounted correctly. Deliverables:  Ansible playbook and inventory.  README with execution instructions. 🔹 Part 3: System Monitoring Script
Task:  Write a Bash or Python script that:
o Shows current memory, CPU, and disk usag






