# Docker for macOS
### Connecting to the Docker Engine API;
On Docker for Mac, clients connect to the Docker Engine through a unix socket: `unix:///var/run/docker.sock`.  

### Connecting from a Container to the host
On linux, the Docker daemon can be configured by using a `daemon.json`, which is located in `/etc/docker/`<sup><a href = "https://docs.docker.com/engine/userguide/networking/default_network/custom-docker0/">[1]</a></sup>.  

On macOS, there is no docker0 bridge. At the time of this writing, docker recommends connecting to a Mac-only DNS name `docker.for.mac.localhost` which will resolve to the internal IP address used by the host<sup><a href = "https://docs.docker.com/docker-for-mac/networking/#use-cases-and-workarounds">[2]</a></sup>. 

### The 10254 Trick
Before the Mac-only DNS name, the recommonded method of connecting to services on a macOS host was to attach an IP alias to the lo0 interface on the Mac host (this is still the recommendation in the Docker for Mac FAQ section of the documentation <sup><a href = "https://docs.docker.com/docker-for-mac/faqs/#how-do-i-connect-to-the-remote-docker-engine-api">[3]</a></sup>).

Using `10.254.254.254` as the assigned IP alias seems to be the convention. I'm not sure why this address in particular, except that it's the last IP address in the recommended range of the first block for using private networks, so maybe that makes it unlikely to be in use by at any given time. <sup><a href = "http://aplawrence.com/Unixart/why_private_networks.html">[4]</a></sup>

The "10254 Trick" is discussed further in this [gist](https://gist.github.com/ralphschindler/535dc5916ccbd06f53c1b0ee5a868c93).




