defmodule DiscussWeb.TopicControllerTest do
  use DiscussWeb.ConnCase

  import Discuss.Factory

  # @listas [a, b, c, d]

  describe "index/2 is success" do
    test "index verifica tópico existente", %{conn: conn} do
      # params = build(:topic_params)

      conn = get(conn, Routes.topic_path(conn, :index))


      assert html_response(conn, 200) =~ "Discuss · Phoenix Framework"
    end

    # test "index lista todos os tópicos" do
      # params =

      # conn = get(conn, Routes.topic_path(conn, :index))

      # assert
    # end
  end

end
