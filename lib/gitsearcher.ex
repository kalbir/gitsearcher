defmodule Gitsearcher do
  @moduledoc """
  Documentation for Gitsearcher.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Gitsearcher.hello
      :world

  """
  # Feed in stats info for all the repos from `stats_info`
  # Choose a stat that you are interested in (:forks, :watchers, :stargazers)
  # See all the repos that have > n for that stat
  # (e.g. for > 10 watchers) - greater_than_n(stats_list, :watchers, 10)
  def greater_than_n(stats_list, stat, n) do
    Enum.filter(stats_list, fn(x) -> x[stat] >  n end)
  end

  def create_a_client(token) do
    Tentacat.Client.new(%{access_token: token})
  end

  def list_the_repos(org, client) do
    Tentacat.Repositories.list_orgs(org, client)
  end

  # Get the stats each of the repos: number of stars, watchers and forks.
  # Put it into a list (one per repo) of key value lists (the stats for the repo)
  def stats_info(list_of_repos) do
    Enum.map(list_of_repos, fn(x) -> [{:name,  Map.get(x, "name")}, {:forks, Map.get(x, "forks_count")}, {:stargazers, Map.get(x, "stargazers_count")}, {:watchers, Map.get(x, "watchers")}] end)
  end

  def number_of_stars(list_of_repos) do
    Enum.map(list_of_repos, fn(x) -> %{:stargazers_count => Map.get(x, "stargazers_count")} end)
  end

  def number_of_watchers(list_of_repos) do
    Enum.map(list_of_repos, fn(x) -> %{:watchers => Map.get(x, "watchers")} end)
  end
end
