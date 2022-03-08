defmodule Discuss.Topic do
  use DiscussWeb, :model

  #  model é a camada resposnável por relacionar o projeto com o banco de dados

  schema "topics" do
    field :title, :string
    belongs_to :user, Discuss.User
    # has_many :comments, Discuss.Comment
  end

  # este método é o responsável por fazer a "chamada"
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
    |> validate_length(:title, min: 3, max: 30)
  end

  # struct representa um registro no banco de dados (o que é-atual)
  # params representa como queremos atualizar o nosso dado(o que vai se tornar)
  # cast registra a mudança (diz o que é(struct) e o que precisa ser(params))
  # validate
end
