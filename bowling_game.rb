class BowlingGame
  attr_accessor :rolls

  def initialize
    @rolls = []
    @total_score  = 0
    @current_roll = 0
  end

  # Record a roll in the game.
  #
  # pins - The Integer number of pins knocked down in this roll.
  #
  # Returns nothing.
  def roll(pins)
    @rolls.push(pins)
  end

  # Returns the Integer score for this game. Expects to be run after all rolls
  # for the game have been recorded.
  def score
    while @current_roll < @rolls.size - 1
      init_roll

      if strike?
        score_strike
      elsif @roll + @next_roll == 10
        @total_score += 10 + @rolls[@current_roll + 2]
        @current_roll += 2
      else
        @total_score += @roll + @next_roll
        @current_roll += 2
      end
    end

    return @total_score
  end

  private

  # Initialize values for roll and next_roll.
  #
  # Returns nothing.
  def init_roll
    @roll      = @rolls[@current_roll]
    @next_roll = @rolls[@current_roll + 1]
  end

  # Returns true if the current roll is a strike, false otherwise.
  def strike?
    @roll == 10
  end


  # Scores a strike frame, and adds it to the total score for the game.
  #
  # Returns nothing.
  def score_strike
    @total_score += 10 + @next_roll + @rolls[@current_roll + 2]
    @current_roll += 1
  end
end