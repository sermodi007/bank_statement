defmodule BankparseWeb.PageController do
  use BankparseWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def import(conn, _params) do
    render conn, "import.html"
  end

  #def parse(conn, %{"user" => user_params}) do
  def parse(conn, params) do
    IO.inspect params
    #IO.inspect user_params["file"].path
    decoded_csv = 
      params["file"].path
    |> File.stream!()
    |> CSV.decode(separator: ?;, headers: true)
    |> Enum.to_list
    IO.inspect decoded_csv 

    IO.puts "++++++++++++++++"
    csv_keys= 
    decoded_csv
    |> Enum.take(1)
    |> IO.inspect
    
    IO.puts "++++++++++++++++"
    render conn, "parse.html", decoded_csv: decoded_csv , csvkey: Map.keys(csv_keys[:ok])
  end
end
