defmodule Voting.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: Voting.Repo

  # we will use the factory system from lib ExMachina to make our sign in admin test
  def admin_factory do
    %Voting.Admin{
      name: "Jane Smith",
      email: "email@example.com",
      password_hash: Bcrypt.hash_pwd_salt("123456")
    }
  end
end
