defmodule Discuss.Factory do
    use ExMachina.Ecto, repo: Discuss.Repo

    def user_factory do
        %Discuss.User{
            email: "abcdefg@email.com",
            provider: "123",
            token: "12"
        }
    end

    def topic_factory do
        %Discuss.Topic{
            title: "testando"
        }
    end

end
