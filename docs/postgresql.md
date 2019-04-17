## Installing PostgreSQL

### Example Playbook

```yaml
- hosts: servers
  become: yes
  any_errors_fatal: true
  roles:
    - role: postgresql
```
