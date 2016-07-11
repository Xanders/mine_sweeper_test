require 'pry'
require './lib/mine_sweeper'

describe MineSweeper do
  describe 'argument validations' do
    it 'raises an exception if wrong level is given' do
      expect { MineSweeper.new 'invalid' }.to raise_error ArgumentError
    end

    it 'raises an exception if no level is given' do
      expect { MineSweeper.new nil }.to raise_error ArgumentError
    end
  end

  describe 'board rendering' do
    let(:buffer) { StringIO.new '' }

    it 'successfully renders the empty board' do
      ms = MineSweeper.new 'empty'

      ms.render buffer
      buffer.string.should == "...\n...\n...\n"
    end

    it 'successfully renders the easy board' do
      ms = MineSweeper.new 'easy'
      ms.render buffer
      buffer.string.should == "111\n1*1\n111\n"
    end

    it 'successfully renders the medium board' do
      ms = MineSweeper.new 'medium'
      ms.render buffer
      buffer.string.should == "111..\n1*21.\n13*2.\n.3*3.\n.2*2.\n"
    end

    it 'successfully renders the hard board' do
      ms = MineSweeper.new 'hard'
      ms.render buffer
      buffer.string.should == "........\n........\n........\n........\n....1232\n....2***\n....3*8*\n....2***\n"
    end

  end

  describe '.boards' do
    it 'is a hash' do
      expect(MineSweeper.boards).to be_a(Hash)
    end

    it 'has board' do
      MineSweeper.boards.values.each do |board|
        expect(board).to be_a(BoardMap)
      end
    end
  end

end
