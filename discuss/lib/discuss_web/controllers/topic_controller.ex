defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

# o controller receberá todas as requisições do usuário e irá se comunicar com a model

  alias Discuss.Topic

  def index(conn, _params) do
    # lista todos os tópicos armazenados no bd
    topics = Repo.all(Topic)
    # renderiza com i idex ou índice onde mostrará uma lista com ourtos recursos
    render conn, "index.html", topics: topics
  end

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})

    # cria a conexão com o arquivo html
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"topic" => topic}) do
    # mudanca de títulos no banco de dados
    changeset = Topic.changeset(%Topic{}, topic)

    # registro no banco de dados
    case Repo.insert(changeset) do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic Created")
        |> redirect(to: topic_path(conn, :index))
        # muda de pag ao inserir um novo tópico/título
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end

  def edit(conn, %{"id" => topic_id}) do
    # encontrara o registro id de cada tópico
    topic = Repo.get(Topic, topic_id)
    changeset =  Topic.changeset(topic)

    render conn, "edit.html", changeset: changeset, topic: topic
  end
end