## Installing Spark

### Example Playbook

```yaml
- name: Install Spark
  hosts: spark
  become: yes
  any_errors_fatal: true
  roles:
    - role: spark
```

Spark устанавливается в директорию `/data/spark`

Мастером считается первый хост, указанный в inventory в группе spark

Порт для master WEBUI 18080
