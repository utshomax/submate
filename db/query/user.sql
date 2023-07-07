-- name: CreateUser :one
INSERT INTO users (
  username, name, bio, email, password, avatar, role, created_at
) VALUES (
  $1, $2, $3, $4, $5, $6, $7, $8
)
RETURNING id, username, name, bio, email, avatar, role, created_at;

-- name: GetUser :one
SELECT * FROM users
WHERE id = $1 LIMIT 1;

-- name: ListUsers :many
SELECT * FROM users
ORDER BY name;