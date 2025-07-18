assuimg we have two servers
ip-10-10-10-9,
ip-10-10-10-10


### cat /etc/ansible/hosts 

[nfs_client] 

ip-10-10-10-9 ansible_host=10.10.10.9 

[nfs_server]

ip-10-10-10-10 ansible_host=10.10.10.10  

[nfs_client:vars]

ansible_user=ubuntu

ansible_ssh_private_key_file=/home/ubuntu/.ssh/Infoimage.pem

type=client

[nfs_server:vars]

ansible_user=ubuntu

ansible_ssh_private_key_file=/home/ubuntu/.ssh/Infoimage.pem

type=server


### ansible all -m ping
[WARNING]: Platform linux on host ip-10-10-10-10 is using the discovered Python interpreter at /usr/bin/python3.12, but future installation of another Python interpreter could
change the meaning of that path. See https://docs.ansible.com/ansible-core/2.18/reference_appendices/interpreter_discovery.html for more information.

ip-10-10-10-10 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.12"
    },
    "changed": false,
    "ping": "pong"
}

[WARNING]: Platform linux on host ip-10-10-10-9 is using the discovered Python interpreter at /usr/bin/python3.12, but future installation of another Python interpreter could
change the meaning of that path. See https://docs.ansible.com/ansible-core/2.18/reference_appendices/interpreter_discovery.html for more information.

ip-10-10-10-9 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.12"
    },
    "changed": false,
    "ping": "pong"
}


ansible nfs_client -m ping
[WARNING]: Platform linux on host ip-10-10-10-9 is using the discovered Python interpreter at /usr/bin/python3.12, but future installation of another Python interpreter could
change the meaning of that path. See https://docs.ansible.com/ansible-core/2.18/reference_appendices/interpreter_discovery.html for more information.

ip-10-10-10-9 | SUCCESS => {

    "ansible_facts": {
    
        "discovered_interpreter_python": "/usr/bin/python3.12"
        
    },
    
    "changed": false,
    
    "ping": "pong"
    
}



### 1. Install Datadog agent
to follow Datadog web site install datadog agent
Make sure you're running an up-to-date version of Ansible on your control node.

step a. ansible-galaxy collection install datadog.dd
step b. assuming we already have inventory
step c. create a datadog_playbook.yaml


- name: Install the Datadog Agent
- 
  import_role:
  
        name: datadog.dd.agent
  

  vars:
  
    datadog_api_key: "<YOUR_API_KEY>"
  

step: d. ansible-playbook -i inventory.yaml datadog_playbook.yaml



2. Install Docker
to follow Docker web site install Docker 
create docker_playbook.yaml

---
- hosts: all
  become: true
  tasks:
    - name: install dependencies
      apt:
        name: "{{item}}"
        state: present
        update_cache: yes
      loop:
        - apt-transport-https
        - ca-certificates
        - curl
        - gnupg-agent
        - software-properties-common
    - name: add GPG key
      apt_key:
        url: https://download.docker.com/linux/ubuntu/gpg
        state: present
    - name: add docker repository to apt
      apt_repository:
        repo: deb https://download.docker.com/linux/ubuntu bionic stable
        state: present
    - name: install docker
      apt:
        name: "{{item}}"
        state: latest
        update_cache: yes
      loop:
        - docker-ce
        - docker-ce-cli
        - containerd.io
    - name: check docker is active
      service:
        name: docker
        state: started
        enabled: yes
    - name: Ensure group "docker" exists
      ansible.builtin.group:
        name: docker
        state: present
    - name: adding ubuntu to docker group
      user:
        name: ubuntu
        groups: docker
        append: yes
    - name: Install docker-compose
      get_url:
        url: https://github.com/docker/compose/releases/download/1.29.2/docker-compose-Linux-x86_64
        dest: /usr/local/bin/docker-compose
        mode: 'u+x,g+x'
    - name: Change file ownership, group and permissions
      ansible.builtin.file:
        path: /usr/local/bin/docker-compose
        owner: ubuntu
        group: ubuntu

 
ansible-playbook docker_playbook.yaml 

PLAY [all] **************************************************************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************************************************
[WARNING]: Platform linux on host ip-10-10-10-9 is using the discovered Python interpreter at /usr/bin/python3.12, but future installation of another Python interpreter could
change the meaning of that path. See https://docs.ansible.com/ansible-core/2.18/reference_appendices/interpreter_discovery.html for more information.
ok: [ip-10-10-10-9]
[WARNING]: Platform linux on host ip-10-10-10-10 is using the discovered Python interpreter at /usr/bin/python3.12, but future installation of another Python interpreter could
change the meaning of that path. See https://docs.ansible.com/ansible-core/2.18/reference_appendices/interpreter_discovery.html for more information.
ok: [ip-10-10-10-10]

TASK [install dependencies] *********************************************************************************************************************************************************
ok: [ip-10-10-10-9] => (item=apt-transport-https)
ok: [ip-10-10-10-10] => (item=apt-transport-https)
ok: [ip-10-10-10-10] => (item=ca-certificates)
ok: [ip-10-10-10-9] => (item=ca-certificates)
ok: [ip-10-10-10-10] => (item=curl)
ok: [ip-10-10-10-9] => (item=curl)
ok: [ip-10-10-10-10] => (item=gnupg-agent)
ok: [ip-10-10-10-9] => (item=gnupg-agent)
ok: [ip-10-10-10-10] => (item=software-properties-common)
ok: [ip-10-10-10-9] => (item=software-properties-common)

TASK [add GPG key] ******************************************************************************************************************************************************************
ok: [ip-10-10-10-10]
ok: [ip-10-10-10-9]

TASK [add docker repository to apt] *************************************************************************************************************************************************
ok: [ip-10-10-10-10]
ok: [ip-10-10-10-9]

TASK [install docker] ***************************************************************************************************************************************************************
ok: [ip-10-10-10-10] => (item=docker-ce)
ok: [ip-10-10-10-9] => (item=docker-ce)
ok: [ip-10-10-10-10] => (item=docker-ce-cli)
ok: [ip-10-10-10-9] => (item=docker-ce-cli)
ok: [ip-10-10-10-10] => (item=containerd.io)
ok: [ip-10-10-10-9] => (item=containerd.io)

TASK [check docker is active] *******************************************************************************************************************************************************
ok: [ip-10-10-10-10] => (item=docker-ce)
ok: [ip-10-10-10-9] => (item=docker-ce)
ok: [ip-10-10-10-10] => (item=docker-ce-cli)
ok: [ip-10-10-10-9] => (item=docker-ce-cli)
ok: [ip-10-10-10-10] => (item=containerd.io)
ok: [ip-10-10-10-9] => (item=containerd.io)

TASK [check docker is active] *******************************************************************************************************************************************************
ok: [ip-10-10-10-10]
ok: [ip-10-10-10-9]

TASK [Ensure group "docker" exists] *************************************************************************************************************************************************
ok: [ip-10-10-10-10]
ok: [ip-10-10-10-9]

TASK [adding ubuntu to docker group] ************************************************************************************************************************************************
ok: [ip-10-10-10-10]
ok: [ip-10-10-10-9]

PLAY RECAP **************************************************************************************************************************************************************************
ip-10-10-10-10             : ok=9    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
ip-10-10-10-9              : ok=9    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


3. Install Docker-compose
create dockercompose_playbook.yaml

---
- hosts: all
  become: true
  tasks:
    - name: Install docker-compose
      get_url:
        url: https://github.com/docker/compose/releases/download/1.29.2/docker-compose-Linux-x86_64
        dest: /usr/local/bin/docker-compose
        mode: 'u+x,g+x'
    - name: Change file ownership, group and permissions
      ansible.builtin.file:
        path: /usr/local/bin/docker-compose
        owner: ubuntu
        group: ubuntu

ansible-playbook dockercompose_playbook.yaml 

PLAY [all] **************************************************************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************************************************
[WARNING]: Platform linux on host ip-10-10-10-10 is using the discovered Python interpreter at /usr/bin/python3.12, but future installation of another Python interpreter could
change the meaning of that path. See https://docs.ansible.com/ansible-core/2.18/reference_appendices/interpreter_discovery.html for more information.
ok: [ip-10-10-10-10]
[WARNING]: Platform linux on host ip-10-10-10-9 is using the discovered Python interpreter at /usr/bin/python3.12, but future installation of another Python interpreter could
change the meaning of that path. See https://docs.ansible.com/ansible-core/2.18/reference_appendices/interpreter_discovery.html for more information.
ok: [ip-10-10-10-9]

TASK [Install docker-compose] *******************************************************************************************************************************************************
changed: [ip-10-10-10-10]
changed: [ip-10-10-10-9]

TASK [Change file ownership, group and permissions] *********************************************************************************************************************************
changed: [ip-10-10-10-10]
changed: [ip-10-10-10-9]

PLAY RECAP **************************************************************************************************************************************************************************
ip-10-10-10-10             : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
ip-10-10-10-9              : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


4. Create a user with sudo permission
(for security best practice, we don't
assign any user with sudo rights)

create usera_playbook.yaml
---
- name: Create a user
  hosts: all
  become: yes
  tasks:
    - name: Add user
      ansible.builtin.user:
        name: testuser
        state: present
        shell: /bin/bash
        comment: "Test User"
        createhome: yes
        group: users
        groups: admin
        append: yes

    - name: Add usera to sudo group
      user:
        name: usera
        groups: sudo
        append: true
        state: present

ansible-playbook createuser_playbook.yaml 

PLAY [Create a user with sudo privileges] *******************************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************************************************
[WARNING]: Platform linux on host ip-10-10-10-10 is using the discovered Python interpreter at /usr/bin/python3.12, but future installation of another Python interpreter could
change the meaning of that path. See https://docs.ansible.com/ansible-core/2.18/reference_appendices/interpreter_discovery.html for more information.
ok: [ip-10-10-10-10]
[WARNING]: Platform linux on host ip-10-10-10-9 is using the discovered Python interpreter at /usr/bin/python3.12, but future installation of another Python interpreter could
change the meaning of that path. See https://docs.ansible.com/ansible-core/2.18/reference_appendices/interpreter_discovery.html for more information.
ok: [ip-10-10-10-9]

TASK [Create a new user] ************************************************************************************************************************************************************
changed: [ip-10-10-10-10]
changed: [ip-10-10-10-9]

TASK [Add user to sudo group] *******************************************************************************************************************************************************
changed: [ip-10-10-10-9]
changed: [ip-10-10-10-10]

TASK [Allow passwordless sudo for the user (Debian/Ubuntu)] *************************************************************************************************************************
changed: [ip-10-10-10-10]
changed: [ip-10-10-10-9]

TASK [Allow passwordless sudo for the user (CentOS/RHEL)] ***************************************************************************************************************************
changed: [ip-10-10-10-9]
changed: [ip-10-10-10-10]

PLAY RECAP **************************************************************************************************************************************************************************
ip-10-10-10-10             : ok=5    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
ip-10-10-10-9              : ok=5    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


ansible-playbook nfsserver_deploy.yaml 

PLAY [all] **************************************************************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************************************************
[WARNING]: Platform linux on host ip-10-10-10-10 is using the discovered Python interpreter at /usr/bin/python3.12, but future installation of another Python interpreter could
change the meaning of that path. See https://docs.ansible.com/ansible-core/2.18/reference_appendices/interpreter_discovery.html for more information.
ok: [ip-10-10-10-10]
[WARNING]: Platform linux on host ip-10-10-10-9 is using the discovered Python interpreter at /usr/bin/python3.12, but future installation of another Python interpreter could
change the meaning of that path. See https://docs.ansible.com/ansible-core/2.18/reference_appendices/interpreter_discovery.html for more information.
ok: [ip-10-10-10-9]

TASK [nfs_server : Deploy the NFS server] *******************************************************************************************************************************************
skipping: [ip-10-10-10-9]
ok: [ip-10-10-10-10]

TASK [nfs_server : Create share for nfs server] *************************************************************************************************************************************
skipping: [ip-10-10-10-9]
ok: [ip-10-10-10-10]

TASK [nfs_server : Setup share in /etc/exports] *************************************************************************************************************************************
skipping: [ip-10-10-10-9]
changed: [ip-10-10-10-10]

RUNNING HANDLER [nfs_server : Restart nfs] ******************************************************************************************************************************************
changed: [ip-10-10-10-10]

PLAY RECAP **************************************************************************************************************************************************************************
ip-10-10-10-10             : ok=5    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
ip-10-10-10-9              : ok=1    changed=0    unreachable=0    failed=0    skipped=3    rescued=0    ignored=0   


ansible-playbook nfsclient_playbook.yaml 

PLAY [nfs_client] *******************************************************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************************************************
[WARNING]: Platform linux on host ip-10-10-10-9 is using the discovered Python interpreter at /usr/bin/python3.12, but future installation of another Python interpreter could
change the meaning of that path. See https://docs.ansible.com/ansible-core/2.18/reference_appendices/interpreter_discovery.html for more information.
ok: [ip-10-10-10-9]

TASK [Mount NFS share] **************************************************************************************************************************************************************
ok: [ip-10-10-10-9]

PLAY RECAP **************************************************************************************************************************************************************************
ip-10-10-10-9              : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
