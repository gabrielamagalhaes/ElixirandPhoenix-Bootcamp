defmodule Discuss.AuthController do
  use DiscussWeb, :controller
  plug Ueberauth

  alias Discuss.User

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    # este metódo irá lidar com todas as infos que vierem do github
    user_params = %{token: auth.credentials.token, email: auth.info.email, provider: "github"}
    changeset = User.changeset(%User{}, user_params)

    signin(conn, changeset)
  end

  defp signin(conn, changeset) do
    case insert_or_update_user(changeset) do
       {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> put_session(:user_id, user.id)
        |> redirect(to: Router.topic_path(conn, :index))

       {:error, _reason} ->
        conn
        |> put_flash(:error, "Error signing in")
        |> redirect(to: Router.topic_path(conn, :index))
    end
  end

  # para add no nosso banco de dados caso o usuário que passar pelo auth, ainda não exista
  defp insert_or_update_user(changeset) do
     #  video 104
    case Repo.get_by(User, email: changeset.changes.email) do
      nil ->
        Repo.isert(changeset)
      user ->
        {:ok, user}
     end
  end
end
