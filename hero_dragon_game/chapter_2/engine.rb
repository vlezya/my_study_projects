require_relative "hero_dragon"

class Engine
  $whose_turn = true
  attr_accessor :hero, :dragon

  def initialize(hero, dragon)
    @hero = hero
    @dragon = dragon
  end

  def next_turn
    while $hero_life.positive? && $dragon_life.positive?
      if $whose_turn
        action_hero = nil
        loop do
          puts "\n!!!!! Ход героя !!!!! (attack / heal)"
          action_hero = gets.chomp.downcase
          if $potions.zero?
            break if action_hero == "attack"

            puts "\nЗелье закончилось. Вы можете только атаковать!"
          elsif action_hero == "attack" || action_hero == "heal"
            break
          end
        end

        if action_hero == "attack"
          hero.attack
        elsif action_hero == "heal"
          hero.drink_potion
        end

        break if $dragon_life <= 0
        $whose_turn = false
      end

      if !$whose_turn
        dragon.attack
      end

      break if $hero_life <= 0
      $whose_turn = true
    end

    if $hero_life <= 0
      puts "\nПобедил ДРАКОН"
      puts "Здоровье Дракона - #{$dragon_life}"
    else
      puts "\nПобедил - ГЕРОЙ!"
      puts "Здоровье героя - #{$hero_life}"
    end
  end
end

engine = Engine.new(Hero, Dragon)
engine.next_turn
