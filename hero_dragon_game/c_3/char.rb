class Char
  attr_reader :current_hp

  def receive_damage(character)
    dmg = character.attack
    @current_hp -= dmg

    dmg
  end

  def attack
    rand(@min_dmg..@max_dmg)
  end
end