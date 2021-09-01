defmodule Discuss.AuthController do
  use DiscussWeb, :controller
  plug Ueberauth

  def callback(conn, params) do
    # este metódo irá lidar com todas as infos que vierem do github
   
  end
end
