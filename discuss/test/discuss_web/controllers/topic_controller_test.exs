defmodule DiscussWeb.TopicControllerTest do
  use DiscussWeb.ConnCase

  import Discuss.Factory
  alias Discuss.Repo

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
end
