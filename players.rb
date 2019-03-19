class Player
  attr_reader :name
  attr_accessor :turn, :life

  def initialize (name, turn)
    @name = name
    @life = 3
    @turn = turn
  end

end