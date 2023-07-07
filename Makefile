createdb: 
	docker exec -it postgres15 createdb --username=root --owner=root submate

dropdb:
	docker exec -it postgres15 dropdb submate

postgres: 
	docker run --name postgres15 -p 5432:5432  -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -d postgres:15-alpine

sqlc: 
	sqlc generate

migrateup:
	migrate -path db/migration -database "postgresql://root:root@localhost:5432/submate?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:root@localhost:5432/submate?sslmode=disable" -verbose down

test:
	go test -v -cover ./...