if ```Unable to find image 'hello-world:latest' locally
docker: Error response from daemon: Head "https://registry-1.docker.io/v2/library/hello-world/manifests/latest": dial tcp: lookup registry-1.docker.io on 192.168.15.1:53: no such host.
See 'docker run --help'.```

just add 
nameserver 8.8.8.8
nameserver 8.8.4.4
in the beginning of /etc/resolv.conf