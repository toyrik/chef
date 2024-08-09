up: docker-up
down: docker-down
init: docker-down-clear docker-pull docker-build docker-up app-init

docker-up:
	docker compose up -d

docker-down:
	docker compose down --remove-orphans

docker-down-clear:
	docker compose down -v --remove-orphans

docker-pull:
	docker compose pull

docker-build:
	docker compose build

app-init: app-perm	app-composer-install app-keygen

app-perm:
	docker compose run --rm php chmod 775 -R storage

app-composer-install:
	docker compose run --rm composer install

app-keygen:
	docker compose run --rm artisan key:generate
