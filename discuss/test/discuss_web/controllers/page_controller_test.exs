defmodule DiscussWeb.PageControllerTest do
  use DiscussWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Discuss · Phoenix Framework"
  end
end
