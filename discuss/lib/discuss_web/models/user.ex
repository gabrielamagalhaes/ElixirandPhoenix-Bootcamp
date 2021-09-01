defmodule Discuss.User do
  use DiscussWeb, :model

  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:emai, :provider, :token])
    |> validate_required([:emai, :provider, :token])
  end

  
end
