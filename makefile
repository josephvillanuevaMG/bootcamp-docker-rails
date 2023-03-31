build:
		docker-compose build

setup:
  	docker-compose run --rm web bin/rails db:setup

up:
	docker-compose up

stop:
	docker-compose stop

restart_db:
  docker-compose run --rm web bin/rails db:drop
  docker-compose run --rm web bin/rails db:create
  docker-compose run --rm web bin/rails db:migrate
  docker-compose run --rm web bin/rails db:seed

migrate:
  docker-compose exec web bin/rails db:migrate

rollback:
  docker-compose exec web bin/rails db:rollback

seed:
  docker-compose exec web bin/rails db:seed

console:
	docker-compose exec web bin/rails c

routes:
	docker-compose exec web bin/rails routes

rails:
	docker-compose exec web bin/rails ${cmd}
