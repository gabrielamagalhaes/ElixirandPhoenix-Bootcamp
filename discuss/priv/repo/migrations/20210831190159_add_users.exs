defmodule Discuss.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    create table("users") do
      add :email, :string
      add :provider, :string
      add :token, :string

      # mostra a hora de cada cadastro
    timestamps()
    end
  end
end
