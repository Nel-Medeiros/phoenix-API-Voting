defmodule Voting.CreateAdminTest do
  use Voting.DataCase, async: true

  alias Voting.{Admin, CreateAdmin}

  describe "run/1" do
    test "returns a struct when the params are valid" do
      params = %{name: "Testson", email: "testson2020@test.com", password: "ilovepudim"}
      assert {:ok, %Admin{} = admin} = CreateAdmin.run(params)
      assert admin.name == "Testson"
      assert admin.email == "testson2020@test.com"
      assert admin.password_hash != "ilovepudim"
    end

    test "returns error when name is missing" do
      params = %{name: "", email: "testson2020@test.com", password: "ilovepudim"}
      assert {:error, %Ecto.Changeset{} = changeset} = CreateAdmin.run(params)
      %{name: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns error when email is missing" do
      params = %{name: "Testson", email: "", password: "ilovepudim"}
      assert {:error, %Ecto.Changeset{} = changeset} = CreateAdmin.run(params)
      %{email: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns error when password is missing" do
      params = %{name: "Testson", email: "testson2020@test.com", password: ""}
      assert {:error, %Ecto.Changeset{} = changeset} = CreateAdmin.run(params)
      %{password: ["can't be blank"]} = errors_on(changeset)
    end
  end
end
