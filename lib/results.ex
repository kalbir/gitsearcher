defmodule Results do

  def all_forks_greater_than_10(org, auth_token) do
    client = Tentacat.Client.new(%{access_token: auth_token})
      Gitsearcher.list_the_repos(org, client)
      |> Gitsearcher.stats_info
      |> Gitsearcher.greater_than_n(:forks, 10)
  end
end
