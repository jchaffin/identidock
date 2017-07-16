### Retrieving Docker ip from inside the host

```sh
/sbin/ip route | awk '/default/ { print $3}'
```
- [ ] TODO Docker Container Communication<sup><a href = "https://docs.docker.com/engine/userguide/networking/default_network/container-communication/#communication-between-containers">[2]</a></sup>
- 

