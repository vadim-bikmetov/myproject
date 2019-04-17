## Install Oracle

Перед установкой необходимо запустить команду

```shell
ansible-galaxy install -f -r requirements.yml
```

Пример ansible playbook-а

```yml
- name: Install Oracle 12.2.0.1 (UTF-8)
  hosts: oracle-utf
  become: yes
  any_errors_fatal: true
  vars:
    - ora_db_charset: 'AL32UTF8'
  roles:
    - role: install-oracle

- name: Install Oracle 12.2.0.1 (CP1251)
  hosts: oracle-win
  become: yes
  any_errors_fatal: true
  vars:
    - ora_db_charset: 'CL8MSWIN1251'
  roles:
    - role: install-oracle
```
