-- name: CreateAccount :one
INSERT INTO accounts (
    user_id,
    category_id,
    title,
    type,
    description,
    value,
    date
) values ($1, $2,$3, $4,$5, $6,$7) RETURNING *;

-- name: GetAccount :one
select * from accounts
where id = $1 limit 1;


-- name: ListAccounts :many
SELECT a.id,
       a.user_id,
       a.title,
       a.type,
       a.description,
       a.value,
       a.date,
       a.created_at,
       c.title as category_title
 FROM accounts a
LEFT JOIN CATEGORIES  c
ON c.id = a.category_id
WHERE a.user_id = $1 and a.type = $2
and a.category_id = $3 and a.title like $4
and a.description like $5 and a.date = $6;

-- name: UpdateAccount :exec
UPDATE accounts
SET title = $2, description = $3, value = $4
WHERE id $1;

-- name: DeleteAccount :exec
DELETE FROM accounts
WHERE id = $1;

-- name: GetAccountsReports :one
SELECT SUM(value) as sum_value from accounts
WHERE user_id = $1 and type = $2;


-- name: GetAccountsGraphs :one
SELECT COUNT(*) from accounts
WHERE user_id = $1 and type = $2;