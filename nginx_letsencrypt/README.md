## Nginx Letsencrypt

A Docker image that can setup a TLS http2 proxy,
with valid Letsencrypt certificate, in a single command.

Your cert will automatically be obtained and renewed
with absolutely no extra work on your part.

### Quick start

1. Get a computer with a public IP
2. Get an A record pointed at that IP
3. Run:

```
docker run -d -e "HOST=<the name of my site>" -e "UPSTEAM_SERVER=<final destination for incoming requests> -e "EMAIL=<my email>" dieff07/nginx-letsencrypt
```

### Usage

The function of the image can be controlled with just 4 env vars.

`$HOST` - the server name of your site.
`$EMAIL` - Your email. This is used by Letsencrypt to contact you if necessary. It is not public.
`$UPSTREAM_SERVER` - The url of the http service which you want to forward requests to.

You can easily run the proxy along with other services using `docker-compose`.
Here is an example that will place a TLS proxy in front of you custom docker image
listening on http port 8000.

<pre>
version: 3.7
services:
  my_app:
    image: my_image
    expose:
      - 8000
  nginx_letsencrypt:
    image: dieff07/nginx-letsencrypt
    env:
      - "HOST=example.com"
      - "EMAIL=me@example.com"
      - "UPSTREAM_SERVER=http://my_app:8000"
    ports:
      - "80:80"
      - "443:443"
</pre>
