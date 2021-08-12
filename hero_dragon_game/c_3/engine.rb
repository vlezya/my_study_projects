require_relative "game_config"
require_relative "char"
require_relative "hero"
require_relative "dragon"

class Engine
  attr_reader :game_config

  def initialize(file = "game_options.yaml")
    @game_config = GameConfig.new(file). # => instance of GameConfig
      load_config # => Hash from YAML file
    
    @dragon = Dragon.new @game_config
    @hero = Hero.new @game_config
    @whose_turn = true
  end

  def next_turn
    while @hero.current_hp.positive? && @dragon.current_hp.positive?
      @whose_turn ? player_turn : dragon_turn
    end

    if @hero.current_hp.positive?
      puts "Победил - ГЕРОЙ!"
      puts "Здоровье героя - #{@hero.current_hp}"
    else
      puts "Победил ДРАКОН"
      puts "Здоровье Дракона - #{@dragon.current_hp}"
    end
  end

  private

  def dragon_turn
    sleep 2
    puts "\n!!!! Атакует Дракон !!!!!\n"
    sleep 1

    received_dmg = @hero.receive_damage(@dragon)

    sleep 1
    puts "\nДракон нанес: #{received_dmg} единиц ущерба!"
    puts "Здоровье героя: #{@hero.current_hp}"

    @whose_turn = true
  end

  def player_turn
    action_hero = nil
    loop do
      puts "\n!!!!! Ход героя !!!!! (attack / heal)"
      action_hero = gets.chomp.downcase

      if @hero.current_potions.zero? && action_hero == "heal"
        puts "\nЗелье закончилось. Вы можете только атаковать!"
      elsif action_hero == "heal"
        @hero.drink_potion

        puts "\nГерой излечился.Здоровье героя равно: #{@hero.current_hp} - единиц"
        puts "Зелий осталось #{@hero.current_potions}\n"

        break
      elsif action_hero == "attack"
        received_dmg = @dragon.receive_damage(@hero)

        sleep 1
        puts "\nГерой нанес: #{received_dmg} единиц ущерба!"
        puts "Здоровье дракона: #{@dragon.current_hp}"

        break
      else
        puts "\nНеизвестная команда"
      end
    end

    @whose_turn = false
  end
end
