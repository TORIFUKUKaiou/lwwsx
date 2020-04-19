defmodule Lwwsx.Parser do
  @moduledoc """
  Generic parser to parse all the Livedoor Weather Web Service api responses
  """

  @doc """
  Parses the response from Livedoor Weather Web Service API calls

  ## Examples

      iex> Lwwsx.Parser.parse({:ok, %HTTPoison.Response{body: "{\\"description\\": {\\"text\\": \\"text\\"}}", headers: [{"Server", "nginx"}], status_code: 200}})
      {:ok, %{"description" => %{"text" => "text"}}, %{"Server" => "nginx"}}

      iex> Lwwsx.Parser.parse({:ok, %HTTPoison.Response{body: "body", status_code: 404}})
      {:error, "body"}

      iex> Lwwsx.Parser.parse({:error, :hoge})
      {:error}

      iex> Lwwsx.Parser.parse(:fuga)
      :fuga
  """
  def parse({:ok, %HTTPoison.Response{body: body, headers: headers, status_code: 200}}) do
    {:ok, parse_response_body(body), parse_headers(headers)}
  end

  def parse({:ok, %HTTPoison.Response{body: body}}), do: {:error, body}

  def parse({:error, _}), do: {:error}

  def parse(response), do: response

  defp parse_response_body(body), do: Jason.decode!(body)
  defp parse_headers(headers), do: Map.new(headers)
end
