# frozen_string_literal: true

# require_relative
require "yaml"

begin
  game_config = YAML.load_file("game_options.yaml")
rescue => e
  puts e.inspect
end

while game_config["hero_life"].positive? && game_config["dragon_life"].positive?
  if game_config["whose_turn"]
    loop do
      puts "\n!!!!! Ход героя !!!!! (attack / heal)"
      game_config["action_hero"] = gets.chomp.downcase
      if (game_config["potions"]).zero?
        break if game_config["action_hero"] == "attack"

        puts "\nЗелье закончилось. Вы можете только атаковать!"
      elsif game_config["action_hero"] == "attack" || game_config["action_hero"] == "heal"
        break
      end
    end

    if game_config["action_hero"] == "attack"
      attack_hero = rand(0..7)
      game_config["dragon_life"] -= attack_hero
      sleep 1
      puts "\nГерой нанес: #{attack_hero} единиц ущерба!"
      puts "Зелий осталось #{game_config["potions"]}"
      puts "Здоровья дракона: #{game_config["dragon_life"]}"
    elsif (game_config["potions"]).positive?
      game_config["potions"] -= 1
      game_config["hero_life"] += 8
      game_config["hero_life"] = 20 if game_config["hero_life"] >= 20
      puts "\nГерой излечился.Здоровье героя равно: #{game_config["hero_life"]} - единиц"
      puts "Зелий осталось #{game_config["potions"]}\n"
    end

    game_config["whose_turn"] = false
  else
    sleep 2
    puts "\n!!!! Атакует Дракон !!!!!\n"
    sleep 1
    agility_hero = rand(0..1)
    attack_dragon = rand(0..9)
    if agility_hero == 1
      game_config["hero_life"] -= attack_dragon
      puts "\nДракон нанес: #{attack_dragon} единиц ущерба!"
    else
      puts
      puts "Мимо!! Герой оказался очень ловким!"
    end
    puts "Здоровья героя: #{game_config["hero_life"]}\n"
    game_config["whose_turn"] = true
  end
end

if game_config["hero_life"].positive?
  puts "Победил - ГЕРОЙ!"
  puts "Здоровье героя - #{game_config["hero_life"]}"
else
  puts "Победил ДРАКОН"
  puts "Здоровье Дракона - #{game_config["hero_life"]}"
end
# Когда ходит дракон, то он может только атаковать героя - величина нанесённого урона также генерируется случайным образом в диапазоне от 0 до 9 (герой подвиженый, и дракон может промазать).Программа завершается, когда показатель здоровья одного из участников опускается ниже единицы.

# Подсказки:

# Организуйте цикл, который будет работать до тех пор, пока показатель здоровья обоих участников больше нуля
# Для проверки того, чей сейчас ход, можно использовать отдельную переменную со значением 1 или true (герой) и 0 или false (дракон). В начале работы программы переменная содержит true, а затем её значение меняется на противоположное на каждой итерации. Использование логических значений представляется более удобным, так как вы можете легко изменить значение на противоположное с помощью оператора not.
# Количество доступных герою зелий также храните в отдельной переменной
# В свой ход игрок должен выбрать с клавиатуры одно из двух действий, поэтому не забудьте организовать проверку ввода. Для этого, например, можно использовать бесконечный цикл
# На каждом ходу имеет смысл сообщать сколько у кого осталось здоровья и сколько зелий есть у героя
