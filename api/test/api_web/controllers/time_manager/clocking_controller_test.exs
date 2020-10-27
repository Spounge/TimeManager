defmodule ApiWeb.TimeManager.ClockingControllerTest do
  use ApiWeb.ConnCase

  alias Api.TimeManager
  alias Api.TimeManager.Clocking

  @create_attrs %{
    status: true,
    time: ~N[2010-04-17 14:00:00]
  }
  @update_attrs %{
    status: false,
    time: ~N[2011-05-18 15:01:01]
  }
  @invalid_attrs %{status: nil, time: nil}

  def fixture(:clocking) do
    {:ok, clocking} = TimeManager.create_clocking(@create_attrs)
    clocking
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all clockings", %{conn: conn} do
      conn = get(conn, Routes.time_manager_clocking_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create clocking" do
    test "renders clocking when data is valid", %{conn: conn} do
      conn = post(conn, Routes.time_manager_clocking_path(conn, :create), clocking: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.time_manager_clocking_path(conn, :show, id))

      assert %{
               "id" => id,
               "status" => true,
               "time" => "2010-04-17T14:00:00"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.time_manager_clocking_path(conn, :create), clocking: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update clocking" do
    setup [:create_clocking]

    test "renders clocking when data is valid", %{conn: conn, clocking: %Clocking{id: id} = clocking} do
      conn = put(conn, Routes.time_manager_clocking_path(conn, :update, clocking), clocking: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.time_manager_clocking_path(conn, :show, id))

      assert %{
               "id" => id,
               "status" => false,
               "time" => "2011-05-18T15:01:01"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, clocking: clocking} do
      conn = put(conn, Routes.time_manager_clocking_path(conn, :update, clocking), clocking: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete clocking" do
    setup [:create_clocking]

    test "deletes chosen clocking", %{conn: conn, clocking: clocking} do
      conn = delete(conn, Routes.time_manager_clocking_path(conn, :delete, clocking))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.time_manager_clocking_path(conn, :show, clocking))
      end
    end
  end

  defp create_clocking(_) do
    clocking = fixture(:clocking)
    %{clocking: clocking}
  end
end
