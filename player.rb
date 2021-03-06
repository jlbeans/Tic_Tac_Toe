# frozen_string_literal: true

# This class initiializes the player with a marker
class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end
