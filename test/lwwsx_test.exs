defmodule LwwsxTest do
  use ExUnit.Case
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  doctest Lwwsx, except: [current: 1, current_text: 1]
  doctest Lwwsx.Parser

  setup_all do
    HTTPoison.start()
  end

  test "current_text" do
    use_cassette "response_mocking" do
      assert Lwwsx.current_text(400_030) |> elem(1) ==
               "I Was Born To Love Elixir! We are the Alchemists, my friends!"
    end
  end
end
