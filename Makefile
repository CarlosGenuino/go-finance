createDb:
	createDb --username=develop --owner=develop financas
postgres:
	docker run --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=1234 -d postgres:14-alpine

migrationUp:
	migrate  -path db/migration -database "postgresql://develop:1234@localhost:5432/financas?sslmode=disable" -verbose up

migrationDrop:
	migrate  -path db/migration -database "postgresql://develop:1234@localhost:5432/financas?sslmode=disable" -verbose drop

.PHONY: createDb postgres migrationUp