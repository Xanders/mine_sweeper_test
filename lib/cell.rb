# frozen_string_literal: true

class Cell
  def initialize
    @mine = false
    @number = 0
  end

  def up
    @number += 1 unless mine?
  end

  def mine!
    @mine = true
    @number = nil
  end

  def mine?
    @mine
  end

  def to_s
    @mine ? BoardMap::BOMB_CHAR : @number.zero? ? BoardMap::EMPTY_CHAR : @number.to_s
  end
end
