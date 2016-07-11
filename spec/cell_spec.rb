require 'pry'
require './lib/cell'

describe Cell do
  let!(:subject) { Cell.new }

  describe '#initialize' do
    it 'not a mine after initializing' do
      expect(subject).not_to be_mine
    end

    it 'has zero mines around after initializing' do
      expect(subject.instance_variable_get(:@number)).to eq(0)
    end
  end

  describe '#up' do
    it 'not a mine after up' do
      subject.up
      expect(subject).not_to be_mine
    end

    it 'increases mines around' do
      subject.up
      expect(subject.instance_variable_get(:@number)).to eq(1)
    end

    it 'not works for mines' do
      subject.mine!
      subject.up
      expect(subject).to be_mine
      expect(subject.instance_variable_get(:@number)).to be(nil)
    end
  end

  describe '#mine!' do
    before { subject.mine! }

    it 'makes cell a mine' do
      expect(subject).to be_mine
    end

    it 'deletes number' do
      expect(subject.instance_variable_get(:@number)).to be(nil)
    end
  end

  describe '#mine?' do
    it 'is a false after initializing' do
      expect(subject.mine?).to be(false)
    end

    it 'is a true after #mine!' do
      subject.mine!
      expect(subject.mine?).to be(true)
    end
  end

  describe '#to_s' do
    it 'returns dot at empty cell with zero number' do
      expect(subject.to_s).to eq(BoardMap::EMPTY_CHAR)
    end

    it 'returns asterisk at mine' do
      subject.mine!
      expect(subject.to_s).to eq(BoardMap::BOMB_CHAR)
    end

    it 'returns number at empty cell with non-zero number' do
      subject.up
      expect(subject.to_s).to eq('1')
    end
  end
end
