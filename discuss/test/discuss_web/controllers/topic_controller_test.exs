defmodule DiscussWeb.TopicControllerTest do
  use DiscussWeb.ConnCase

  import Discuss.Factory
  alias Discuss.Repo

  @create_attrs %{title: "testando tópico" }
  @update_attrs %{title: "testando tópico atualizado"}

  describe "index/2 is success" do
    test "check existing topic", %{conn: conn} do
      conn = get(conn, Routes.topic_path(conn, :index))

      assert html_response(conn, 200) =~ "Discuss · Phoenix Framework"
    end

    test "check all existing topics", %{conn: conn} do
      topic1 = insert(:topic)
      topic2 = insert(:topic, title: "abcdef")

      response = get conn, Routes.topic_path(conn, :index)


      assert html_response(response, 200) =~ topic1.title
      assert html_response(response, 200) =~ topic2.title
    end
  end

  describe "create/2 is success" do
    test "create returns 200", %{conn: conn} do
      conn = post(conn, Routes.topic_path(conn, :create), topic: @create_attrs)

      assert redirected_to(conn) == Routes.topic_path(conn, :index)

      conn = get(conn, Routes.topic_path(conn, :index))
      assert html_response(conn, 200) =~ "Discuss · Phoenix Framework"
    end
  end

  describe "edit/2 is success" do
    setup [:create_topic]

    test "edit returns 200", %{conn: conn, topic: topic} do
      topic = insert(:topic)

      conn = get(conn, Routes.topic_path(conn, :edit, topic))
      assert html_response(conn, 200) =~ "Discuss · Phoenix Framework"
    end
  end

  describe "update/3 is success" do
    setup [:create_topic]

    test "update returns 200", %{conn: conn, topic: topic} do
      topic = insert(:topic)
      conn = get(conn, Routes.topic_path(conn, :edit, topic), topic: @update_attrs)

      assert redirected_to(conn) == Routes.topic_path(conn, :index)

      conn = get(conn, Routes.topic_path(conn, :index))
      assert html_response(conn, 200) =~ "The topic was updated"
    end
  end

  describe "delete/2 is success" do
    setup [:create_topic]

    test "delete a topic", %{conn: conn, topic: topic} do
      topic = insert(:topic)
      conn = delete(conn, Routes.topic_path(conn, :delete, topic))

      assert redirected_to(conn) == Routes.topic_path(conn, :index)
    end
  end

  defp create_topic(_) do
    topic = topic_factory()
    %{topic: topic}
  end
end
