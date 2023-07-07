package submate

import (
	"context"
	"database/sql"
	"testing"

	"github.com/stretchr/testify/require"
	"github.com/utshomax/submate/util"
)

var userRoles = []string{"USER", "ADMIN"}

func TestCreateUser(t *testing.T) {
	user := CreateUserParams{
		Username: sql.NullString{String: util.RandomString(5), Valid: true},
		Name:     sql.NullString{String: util.RandomString(7), Valid: true},
		Password: util.RandomString(5),
		Email:    util.RandomString(5) + "@gmail.com",
		Bio:      sql.NullString{String: util.RandomString(10), Valid: true},
		Avatar:   sql.NullString{String: "", Valid: true},
		Role:     sql.NullString{String: util.RandomElement(userRoles), Valid: true},
	}
	createdUser, err := testQueries.CreateUser(context.Background(), user)
	require.NoError(t, err)
	require.NotEmpty(t, user)

	require.Equal(t, user.Username, createdUser.Username)
	require.Equal(t, user.Email, createdUser.Email)
	require.Equal(t, user.Bio, createdUser.Bio)
	require.NotZero(t, createdUser.ID)
	require.Equal(t, user.Role, createdUser.Role)
}
