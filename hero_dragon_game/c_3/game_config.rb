require "yaml"

class GameConfig
  def initialize(file = "game_options.yaml")
    @file = file
  end

  def load_config
      YAML.load_file @file # => hash
    rescue => error
      puts error.inspect
      exit
  end
end