defmodule GitsearcherTest do
  use ExUnit.Case
  doctest Gitsearcher

  test "greets the world" do
    assert Gitsearcher.hello() == :world
  end
end
