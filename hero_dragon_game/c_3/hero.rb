require_relative "char"

class Hero < Char
  attr_reader :current_potions

  def initialize(game_config)
    @current_hp = game_config["max_hero_life"]
    @current_potions = game_config["max_potions"]
    @min_dmg = game_config["min_player_dmg"]
    @max_dmg = game_config["max_player_dmg"]
  end

  def drink_potion
    return if @current_potions < 1

    @current_hp += 8
    @current_hp = 20 if @current_hp >= 20
    @current_potions -= 1
  end
end
