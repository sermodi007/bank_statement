defmodule BankparseWeb.PageController do
  use BankparseWeb, :controller
  require Logger

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def import(conn, _params) do
    render(conn, "import.html")
  end

  # def parse(conn, %{"user" => user_params}) do
  def parse(conn, params) do
    IO.inspect(params)
    # IO.inspect user_params["file"].path
    decoded_csv =
      params["file"].path
      |> File.stream!()
      |> CSV.decode!(separator: ?;, headers: true)
      |> Enum.to_list()

    IO.inspect(decoded_csv)

    IO.puts("++++++++++++++++")

    [csv_keys|_tail] =
      decoded_csv
      |> Enum.take(1)

    IO.inspect(csv_keys)
    IO.puts("++++++++++++++++")

    csvkey = Map.keys(csv_keys)
    IO.inspect(csvkey)


    #render(conn, "parse.html", csvkey: csvkey)
    #IO.puts("++++++++++++++++")
    #IO.inspect(conn)

    conn
    |> assign(:decoded_csv, decoded_csv)
    |> render("parse.html", csvkey: csvkey)

  end

  def preparse(conn, params) do
    IO.puts("******+++++++++++")
    Logger.debug "Assigns value: #{inspect(params)}"
    IO.puts("******+++++++++++")
    #IO.inspect(conn)
    render(conn, "preparse.html")
  end
end
