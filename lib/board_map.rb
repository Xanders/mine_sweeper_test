# frozen_string_literal: true

require_relative 'cell'

class BoardMap
  BOMB_CHAR  = '*'
  EMPTY_CHAR = '.'
  RADIUS = [-1, 0, 1].freeze

  def initialize(size, mines)
    @field = Array.new(size) { Array.new(size) { Cell.new } }
    indexes = 0...size
    mines.each do |(x, y)|
      cell(x, y).mine!
      RADIUS.each { |i| RADIUS.each { |j| cell(x + i, y + j)&.up } }
    end
  end

  def cell(x, y)
    @field[y][x] if limits.include?(x) && limits.include?(y)
  end

  def to_s
    @field.map { |row| row.map(&:to_s).join.concat "\n" }.join
  end

  private

  def limits
    @limits ||= 0...@field.size
  end
end
