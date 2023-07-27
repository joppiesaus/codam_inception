all:

rm_volumes:
	docker-compose down --volumes

.PHONY: all rm_volumes