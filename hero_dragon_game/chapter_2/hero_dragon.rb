class Hero
  $hero_life = 20
  $potions = 2
  ATTACK_HERO = rand(0..7)

  class << self
    def attack
      receive_damage
    end

    def drink_potion
      $hero_life += 8
      if $hero_life >= 20
        $hero_life = 20
      end
      if $potions > 0
        $potions -= 1
        puts "\nГерой излечился.Здоровье героя равно: #{$hero_life} - единиц"
        puts "Зелий осталось #{$potions}\n"
      else
        puts "\nЗелье закончилось!\n"
      end
    end

    def receive_damage
      $dragon_life -= ATTACK_HERO
      sleep 1
      puts "\nГерой нанес: #{ATTACK_HERO} единиц ущерба!"
      puts "Зелий осталось #{$potions}"
      puts "Здоровья дракона: #{$dragon_life}\n"
    end
  end
end

class Dragon
  $dragon_life = 30
  ATTACK_DRAGON = rand(0..9)

  class << self
    def attack
      receive_damage
    end

    def receive_damage
      sleep 2
      puts "\n!!!! Атакует Дракон !!!!!\n"
      sleep 1
      agility_hero = rand(0..1)
      if agility_hero == 1
        $hero_life -= ATTACK_DRAGON
        puts "\nДракон нанес: #{ATTACK_DRAGON} единиц ущерба!"
        puts "\nЗдоровья героя: #{$hero_life}\n"
      else
        puts "\nМимо!! Герой оказался очень ловким!"
        puts "Здоровья героя: #{$hero_life}\n"
      end
    end
  end
end
