class Warrior
  RANK = ["Pushover", "Novice", "Fighter", "Warrior", "Veteran", "Sage", "Elite", "Conqueror", "Champion", "Master", "Greatest"].freeze
  attr_accessor :level, :rank, :achievements, :experience

  def initialize
    @level = 1
    @rank = RANK[0]
    @experience = 100
    @achievements = []
  end

  def level
    @level
  end

  # def experience
  #   if @experience > 10000
  #     @experience = 10000
  #   end
  #   @experience
  # end

  def increment_exp(additional_experience)
    @experience += additional_experience
    @experience = 10000 if @experience > 10000
  end

  def rank
    index = self.level / 10
    @rank = RANK[index]
  end

  def achievements 
    @achievements
  end

  def battle(enemy_level)
    if !(enemy_level >= 1 && enemy_level <= 100)
      return "Invalid level"
    end

    if (self.level + 5 <= enemy_level) && (self.rank < enemy_level.rank )
      return "You've been defeated"
    end

    if self.level == enemy_level
      #@experience += 10
      increment_exp 10
      self.level = calculate_level(@experience)
      self.rank
      return "A good fight"
    elsif self.level - 1 == enemy_level
      #@experience += 5
      increment_exp
      self.level = calculate_level(@experience)
      self.rank
      return "A good fight"
    elsif self.level >= enemy_level + 2
      return "Easy fight" 
    elsif self.rank != enemy_level.rank
      @experience
    elsif self.level < enemy_level
      #@experience += 20 * (enemy_level - self.level) * (enemy_level - self.level)
      increment_exp 20 * (enemy_level - self.level) * (enemy_level - self.level)
      self.level = calculate_level(@experience)
      self.rank
      return "An intense fight"
    end
  end

  def calculate_level(exp)
    if exp >= 100 && exp <= 10000
      exp/100
    elsif exp > 10000
      100

    end
  end

  def training(event)
    description, experience, min_level = event
    if level >= min_level
      @experience += experience
      self.level = calculate_level(@experience)
      self.rank 
      @achievements << event
    end
  end
end

p bruce_lee = Warrior.new
p bruce_lee.level         # => 1
p bruce_lee.experience    # => 100
p bruce_lee.rank          # => "Pushover"
p bruce_lee.achievements  # => []
p bruce_lee.training(["Defeated Chuck Norris", 9000, 1]) # => "Defeated Chuck Norris"
p bruce_lee.experience    # => 9100
p bruce_lee.level         # => 91
p bruce_lee.rank          # => "Master"
p bruce_lee.battle(90)    # => "A good fight"
p bruce_lee.experience    # => 9105
p bruce_lee.achievements 