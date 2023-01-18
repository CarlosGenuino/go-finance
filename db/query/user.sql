-- name: CreateUser :one
INSERT INTO USERS (username, password, email) values ($1, $2, $3) RETURNING *;

-- name: GetUser :one
SELECT * FROM USERS WHERE username = $1 LIMIT 1;

-- name: GetUserById :one
SELECT * FROM USERS WHERE id = $1 LIMIT 1;