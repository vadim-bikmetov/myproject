## Installing Cassandra

### Example Playbook

```yaml
- name: Install Cassandra
  hosts: cassandra
  become: yes
  any_errors_fatal: true
  roles:
    - role: cassandra
```
Cassandra устанавливается в директорию `/data/ces`

Мастер-нодой в кластере считается первый хост, указанный в inventory в группе cassandra