class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    @shows.flat_map do |show|
      show.characters
    end
  end

  def actors_by_show
    actors_by_show = {}
    @shows.each do |show|
      actors_by_show[show] = show.actors
    end
    actors_by_show
  end

end
