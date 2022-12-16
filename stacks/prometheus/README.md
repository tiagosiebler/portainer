# Prometheus with node_exporter

Simplish stack with node_exporter. Not sure if node_exporter is fully working though.

## Portainer steps
- On the host machine, prepare the prometheus config folder:
```bash
sudo mkdir /etc/prometheus;
```
- Edit the `/etc/prometheus/prometheus.yml` file with the example here, feel free to modify it:
```
sudo nano /etc/prometheus/prometheus.yml
```
- Make sure to copy/paste/write/save this prometheus.yml before starting the stack.
- Create a new stack in portainer
- Paste the docker compose from this folder. It will use the /etc/prometheus/prometheus.yml from the host machine.

If you improve the prometheus setup, please share it (or log an issue).
