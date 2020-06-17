require 'minitest/autorun'
require 'minitest/pride'
require './lib/network'
require './lib/show'
require './lib/character'
require 'pry'

class NetworkTest < Minitest::Test

  def test_it_exists
    nbc = Network.new("NBC")
    assert_instance_of Network, nbc
  end

  def test_it_has_attributes
    nbc = Network.new("NBC")
    assert_equal "NBC", nbc.name
    assert_equal [], nbc.shows
  end

  def test_it_can_add_shows
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])
    nbc = Network.new("NBC")
    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)
    assert_equal [knight_rider, parks_and_rec], nbc.shows
  end

  def test_it_returns_main_characters
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])
    nbc = Network.new("NBC")
    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)
    assert_equal [michael_knight, kitt, leslie_knope, ron_swanson], nbc.main_characters
  end

  def test_it_returns_actors_by_show
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])
    nbc = Network.new("NBC")
    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)
    assert_equal ({knight_rider => ["David Hasselhoff", "William Daniels"], parks_and_rec => ["Amy Poehler", "Nick Offerman"]}), nbc.actors_by_show
  end

end


# ## Iteration 4
# 
# Use TDD to update your `Network` class so that it responds to the following interaction pattern. An actor is considered prolific if they have been in more than one show for that network:
#
# ```ruby
# pry(main)> require './lib/network'
# # => true
#
# pry(main)> require './lib/show'
# # => true
#
# pry(main)> require './lib/character'
# # => true
#
# pry(main)> nbc = Network.new("NBC")
# # => #<Network:0x00007fe5f83ea3b0...>
#
# pry(main)> michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
# # => #<Character:0x00007fe5f88721f8...>
#
# pry(main)> kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
# # => #<Character:0x00007fe5f8448f78...>
#
# pry(main)> knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
# # => #<Show:0x00007fe5f8398970...>
#
# pry(main)> mitch = Character.new({name: "Mitch Buchannon", actor: "David Hasselhoff", salary: 1_200_000})
# # => #<Character:0x00007fe5f8448f78...>
#
# pry(main)> baywatch = Show.new("Baywatch", "Gregory Bonann", [mitch])
# # => #<Show:0x00007fe5f8398970...>
#
# pry(main)> leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
# # => #<Character:0x00007fe5f832bb18...>
#
# pry(main)> ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
# # => #<Character:0x00007fe5f8172a60...>
#
# pry(main)> parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])
# # => #<Show:0x00007fe5f88b0a20...>
#
# pry(main)> parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])
# # => #<Show:0x00007fe5f88b0a20...>
#
# pry(main)> nbc.add_show(knight_rider)
#
# pry(main)> nbc.add_show(baywatch)
#
# pry(main)> nbc.add_show(parks_and_rec)
#
# pry(main)> nbc.shows_by_actor
# # => {
# #      "David Hasselhoff" => [knight_rider, baywatch],
# #      "William Daniels" => [knight_rider],
# #      "Amy Poehler" => [parks_and_rec],
# #      "Nick Offerman" => [parks_and_rec]
# #    }
#
# pry(main)> nbc.prolific_actors
# # => ["David Hasselhoff"]
#
# ```
