defmodule Lwwsx.Api do
  @moduledoc """
  Simple API wrapper for Livedoor Weather Web Service
  """
  alias Lwwsx.Parser

  @base_url "http://weather.livedoor.com/forecast/webservice/json/v1"

  @doc """
  Perform a forecast API call for given city
  """
  def forecast(city), do: read(city)

  defp read(city) do
    build_url(city)
    |> HTTPoison.get()
    |> Parser.parse()
  end

  defp build_url(city) do
    "#{@base_url}?city=#{city}"
  end
end
