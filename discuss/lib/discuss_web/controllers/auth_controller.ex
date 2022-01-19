defmodule Discuss.AuthController do
  use DiscussWeb, :controller
  plug Ueberauth

  alias Discuss.User

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    # este metódo irá lidar com todas as infos que vierem do github
    user_params = %{token: auth.credentials.token, email: auth.info.email, provider: "github"}
    changeset = User.changeset(%User{}, user_params)
  end
end
