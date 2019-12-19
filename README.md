# Lwwsx

> A Livedoor Weather Web Service api client for Elixir

## Installation

The package can be installed as:

Add `lwwsx` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:lwwsx, "~> 0.1.0"}
  ]
end
```

## Usage

### Examples

```elixir
Lwwsx.current(400030)

Lwwsx.current_text(400030)

Lwwsx.cities() |> Enum.random() |> elem(0) |> Lwwsx.current_text()
```

## License

Lwwsx is licensed under the [MIT License](LICENSE).
