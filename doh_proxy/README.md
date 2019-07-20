# DOH Proxy

Doh proxy is a docker image for the [ruost-doh](https://github.com/jedisct1/rust-doh) server.
It provides an HTTP gateway that forwards DNS requests to a traditional udp/53 DNS service.

### Usage

<pre>
doh-proxy
A DNS-over-HTTP server proxy

USAGE:
    doh-proxy [FLAGS] [OPTIONS]

FLAGS:
    -K, --disable-keepalive    Disable keepalive
    -P, --disable-post         Disable POST queries
    -h, --help                 Prints help information
    -V, --version              Prints version information

OPTIONS:
    -E, --err-ttl <err_ttl>                          TTL for errors, in seconds [default: 2]
    -l, --listen-address <listen_address>            Address to listen to [default: 127.0.0.1:3000]
    -b, --local-bind-address <local_bind_address>    Address to connect from [default: 0.0.0.0:0]
    -c, --max-clients <max_clients>                  Maximum number of simultaneous clients [default: 512]
    -X, --max-ttl <max_ttl>                          Maximum TTL, in seconds [default: 604800]
    -T, --min-ttl <min_ttl>                          Minimum TTL, in seconds [default: 10]
    -p, --path <path>                                URI path [default: /dns-query]
    -u, --server-address <server_address>            Address to connect to [default: 9.9.9.9:53]
    -t, --timeout <timeout>                          Timeout, in seconds [default: 10]
</pre>

### About the image

This image contains a build of `doh-proxy` for `x86_64-unknown-linux-musl`.

The build is statically linked, so no other files are present in the image.
