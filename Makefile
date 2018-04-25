build:
	docker build -t ebuildy/roxy-dev src

run:
	docker run -ti --rm -e ROXY_WEB_DOMAIN=roxy.127.0.0.1.xip.io -p 8080:80 ebuildy/roxy-dev
