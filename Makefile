build:
	docker build -t ebuildy/roxy-dev src

run:
	docker run -ti --rm -p 8080:80 ebuildy/roxy-dev
