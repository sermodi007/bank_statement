defmodule Bankparse.StatementTest do
  use Bankparse.DataCase

  alias Bankparse.Statement

  describe "lists" do
    alias Bankparse.Statement.List

    @valid_attrs %{amount: 120.5, date: ~D[2010-04-17], place: "some place", type: "some type"}
    @update_attrs %{amount: 456.7, date: ~D[2011-05-18], place: "some updated place", type: "some updated type"}
    @invalid_attrs %{amount: nil, date: nil, place: nil, type: nil}

    def list_fixture(attrs \\ %{}) do
      {:ok, list} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Statement.create_list()

      list
    end

    test "list_lists/0 returns all lists" do
      list = list_fixture()
      assert Statement.list_lists() == [list]
    end

    test "get_list!/1 returns the list with given id" do
      list = list_fixture()
      assert Statement.get_list!(list.id) == list
    end

    test "create_list/1 with valid data creates a list" do
      assert {:ok, %List{} = list} = Statement.create_list(@valid_attrs)
      assert list.amount == 120.5
      assert list.date == ~D[2010-04-17]
      assert list.place == "some place"
      assert list.type == "some type"
    end

    test "create_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Statement.create_list(@invalid_attrs)
    end

    test "update_list/2 with valid data updates the list" do
      list = list_fixture()
      assert {:ok, list} = Statement.update_list(list, @update_attrs)
      assert %List{} = list
      assert list.amount == 456.7
      assert list.date == ~D[2011-05-18]
      assert list.place == "some updated place"
      assert list.type == "some updated type"
    end

    test "update_list/2 with invalid data returns error changeset" do
      list = list_fixture()
      assert {:error, %Ecto.Changeset{}} = Statement.update_list(list, @invalid_attrs)
      assert list == Statement.get_list!(list.id)
    end

    test "delete_list/1 deletes the list" do
      list = list_fixture()
      assert {:ok, %List{}} = Statement.delete_list(list)
      assert_raise Ecto.NoResultsError, fn -> Statement.get_list!(list.id) end
    end

    test "change_list/1 returns a list changeset" do
      list = list_fixture()
      assert %Ecto.Changeset{} = Statement.change_list(list)
    end
  end
end
