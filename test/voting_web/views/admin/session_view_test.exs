defmodule VotingWeb.Admin.SessionViewTest do
  use ExUnit.Case, async: true

  alias VotingWeb.Admin.SessionView

  import Voting.Factory

  test "render/2 returns ok and the admin data" do
    admin = params_for(:admin)

    assert %{status: "ok", data: %{name: "Jane Smith", token: "emanuel"}} =
             SessionView.render("session.json", %{admin: admin, token: "emanuel"})
  end
end
