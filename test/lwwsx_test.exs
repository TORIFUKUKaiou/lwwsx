defmodule LwwsxTest do
  use ExUnit.Case
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  doctest Lwwsx, except: [current: 1, current_text: 1]
  doctest Lwwsx.Parser

  @message "I Was Born To Love Elixir! We are the Alchemists, my friends!"

  setup_all do
    HTTPoison.start()
  end

  test "current" do
    use_cassette "response_mocking" do
      {:ok, %{}} = Lwwsx.current(400_030)
      assert true
    end

    use_cassette "response_mocking_error" do
      {:error, msg} = Lwwsx.current(400_030)
      assert msg == @message
    end
  end

  test "current_text" do
    use_cassette "response_mocking" do
      assert Lwwsx.current_text(400_030) |> elem(1) == @message
    end

    use_cassette "response_mocking_error" do
      {:error, msg} = Lwwsx.current_text(400_030)
      assert msg == @message
    end
  end
end
