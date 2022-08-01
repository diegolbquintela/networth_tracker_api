createdb:
	docker exec -it postgres12 createdb --username=root --owner=root networth_tracker

dropdb:
	docker exec -it postgres12 dropdb networth_tracker

postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=mysecreetpassword -d postgres:12-alpine

migrateup:
	migrate -path db/migration -database "postgresql://root:mysecreetpassword@localhost:5432/networth_tracker?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:mysecreetpassword@localhost:5432/networth_tracker?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb migrateup migratedown