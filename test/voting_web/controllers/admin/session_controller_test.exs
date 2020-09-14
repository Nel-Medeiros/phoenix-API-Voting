defmodule VotingWeb.Admin.SessionControllerTest do
  use VotingWeb.ConnCase, async: true

  import Voting.Factory

  describe "create/2" do
    setup %{conn: conn} do
      insert(:admin, name: "John Smith", email: "luis@test.com")

      %{conn: conn}
    end

    test "returns 200 when admin credentials are valid", %{conn: conn} do
      conn =
        post(conn, "/api/v1/admin/sign_in", %{"email" => "luis@test.com", "password" => "123456"})

      assert %{"status" => "ok", "data" => %{"name" => "John Smith", "token" => _}} =
               json_response(conn, 200)
    end

    test "returns 401 when admin email is invalid", %{conn: conn} do
      conn =
        post(conn, "/api/v1/admin/sign_in", %{
          "email" => "invalid@test.com",
          "password" => "123456"
        })

      assert %{"status" => "unauthenticated"} = json_response(conn, 401)
    end

    test "returns 401 when admin password is invalid", %{conn: conn} do
      conn =
        post(conn, "/api/v1/admin/sign_in", %{"email" => "luis@test.com", "password" => "654321"})

      assert %{"status" => "unauthenticated"} = json_response(conn, 401)
    end
  end
end
