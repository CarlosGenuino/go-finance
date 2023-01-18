-- name: CreateCategory :one
INSERT INTO CATEGORIES (user_id, title, type, description) values ($1, $2, $3, $4) RETURNING *;

-- name: GetCategoryById :one
SELECT * FROM CATEGORIES WHERE id = $1 LIMIT 1; 

-- name: GetCategoryByUserId :many
SELECT * FROM CATEGORIES WHERE user_id = $1 and type = $2 and title like $3 and description like $4;

-- name: UpdateCategory :exec
UPDATE CATEGORIES SET title = $2, description = $3 WHERE id = $1;

-- name: DeleteCategory :exec
DELETE FROM CATEGORIES WHERE id = $1;
