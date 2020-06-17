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

  def shows_by_actor
    actors = shows.map do |show|
      show.actors
    end.flatten
    actors.to_h {|actor| [actor, shows.select {|show| show if show.actors.include?(actor)}]}
  end

  def prolific_actors
    actors = []
    shows_by_actor.each do |actor, show|
      actors << actor if show.count > 1
    end
    actors
  end

end
