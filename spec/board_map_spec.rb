require 'pry'
require './lib/board_map'

describe BoardMap do
  let(:size) { 0 }
  let(:mines) { [] }
  subject { BoardMap.new(size, mines) }

  describe '#to_s' do
    let(:size) { 4 }

    context 'no mines' do
      let(:mines) { [] }

      it 'return a foratted string map' do
        expect(subject.to_s).to eq("....\n....\n....\n....\n")
      end
    end

    context 'with mines' do
      let(:mines) { [[2, 3], [1, 1]] }

      it 'return a foratted string map' do
        expect(subject.to_s).to eq("111.\n1*1.\n1221\n.1*1\n")
      end
    end
  end

  describe '#cell' do
    let(:size) { 4 }

    it 'return a cell with good coordinates' do
      expect(subject.cell(0, 0)).to be_a(Cell)
      expect(subject.cell(1, 2)).to be_a(Cell)
      expect(subject.cell(3, 3)).to be_a(Cell)
    end

    it 'return nil with bad coordinates' do
      expect(subject.cell(-1, 0)).to be(nil)
      expect(subject.cell(0,  4)).to be(nil)
      expect(subject.cell(4, -1)).to be(nil)
    end
  end
end
