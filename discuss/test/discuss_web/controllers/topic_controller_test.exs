defmodule DiscussWeb.TopicControllerTest do
  use DiscussWeb.ConnCase

  import Discuss.Factory

  @create_attrs %{title: "testando tópico" }
  @update_attrs %{title: "testando tópico atualizado"}
  @invalid_attrs1 %{title: "ab"}
  @invalid_attrs2 %{title: "aaaaabbbbbcccccdddddeeeeefffffggggghhhhh"}

  describe "Successful index tests" do
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

  describe "Successful create tests" do
    test "create a topic when data is valid", %{conn: conn} do
      conn = post(conn, Routes.topic_path(conn, :create), topic: @create_attrs)

      assert redirected_to(conn) == Routes.topic_path(conn, :index)

      conn = get(conn, Routes.topic_path(conn, :index))
      assert html_response(conn, 200) =~ "Discuss · Phoenix Framework"
    end
  end

  describe "Successful edit tests" do
    setup [:create_topic]

    test "edit a topic when topic's name is valid", %{conn: conn} do
      topic = insert(:topic)

      conn = get(conn, Routes.topic_path(conn, :edit, topic))
      assert html_response(conn, 200) =~ "Discuss · Phoenix Framework"
    end
  end

  describe "Successful update tests" do
    setup [:create_topic]

    test "topic is updated when a valid data is passed", %{conn: conn} do
      topic = insert(:topic)

      conn = put(conn, Routes.topic_path(conn, :update, topic), topic: @update_attrs)
      assert redirected_to(conn) == Routes.topic_path(conn, :index)

      conn = get(conn, Routes.topic_path(conn, :index))
      assert html_response(conn, 200) =~ "Discuss · Phoenix Framework"
    end

    test "returns error when topic's value is nil", %{conn: conn} do
      topic = insert(:topic)

      conn = put(conn, Routes.topic_path(conn, :update, topic), topic: @invalid_attrs)
      assert html_response(conn, 200) =~ "Discuss · Phoenix Framework"
    end
  end

  describe "Successful delete tests" do
    setup [:create_topic]

    test "delete a topic", %{conn: conn} do
      topic = insert(:topic)
      conn = delete(conn, Routes.topic_path(conn, :delete, topic))

      assert redirected_to(conn) == Routes.topic_path(conn, :index)
    end
  end

  describe "Failure create test" do
    test "create returns error when title is smaller than 3 characters", %{conn: conn} do
      conn = post(conn, Routes.topic_path(conn, :create), topic: @invalid_attrs1)
      assert html_response(conn, 200) =~ "should be at least 3 character(s)"
    end

    test "create returns error when title is bigger than 30 characters", %{conn: conn} do
      conn = post(conn, Routes.topic_path(conn, :create), topic: @invalid_attrs2)
      assert html_response(conn, 200) =~ "should be at most 30 character(s)"
    end
  end



  defp create_topic(_) do
    topic = topic_factory()
    %{topic: topic}
  end
end
