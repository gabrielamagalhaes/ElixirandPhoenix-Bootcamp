defmodule Discuss.Factory do
    use ExMachina

    def topic_params_factory do
        %{
            "title" => "abcdef"
        }
    end
end
