require_relative "char"

class Dragon < Char
  def initialize(game_config)
    @game_config = game_config
    @current_hp = game_config["max_dragon_life"]
    @min_dmg = @game_config["min_dragon_dmg"]
    @max_dmg = @game_config["max_dragon_dmg"]
  end
end


