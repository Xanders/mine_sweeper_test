# frozen_string_literal: true

require 'yaml'
require_relative 'board_map'

class MineSweeper
  BOARDS_FILE = 'boards.yml'

  def initialize(type)
    @board = self.class.boards[type] or raise BadBoard.new(type)
    @map = BoardMap.new(@board['size'], @board['mines'])
  end

  def render(io)
    io.write(@map)
  end

  def self.boards
    @@boards ||= YAML.load_file(BOARDS_FILE).inject({}) do |hash, board| # group_by не подходит, т.к. значениями становятся массивы
      hash[board['type']] = board
      hash
    end
  end

  class BadBoard < ArgumentError
    def initialize(type)
      super("incorrect type #{type.inspect}, only #{MineSweeper.boards.keys.map(&:inspect) * ', '} allowded")
    end
  end
end
