defmodule VotingWeb.Admin.SessionController do
  use VotingWeb, :controller

  # for more details check the doc: https://hexdocs.pm/plug/Plug.Conn.html

  # we will log the admin via HTTP
  alias Voting.SignInAdmin

  alias VotingWeb.Guardian

  def create(conn, %{"email" => email, "password" => password}) do
    case SignInAdmin.run(email, password) do
      {:ok, admin} ->
        # encode a token for a resource
        {:ok, token, _} = Guardian.encode_and_sign(admin)

        render(conn, "session.json", %{admin: admin, token: token})

      {:error, _} ->
        conn
        |> put_status(401)
        |> json(%{status: "unauthenticated"})
    end
  end
end
