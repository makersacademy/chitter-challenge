require 'blab'

describe Blab do
  describe '.all' do
    it 'returns all the blabs' do
      blabs = [
        Blab.create('test blab one'),
        Blab.create('test blab two'),
        Blab.create('test blab three')
      ]
      expect(Blab.all).to eq blabs
    end
  end

  describe '.create' do
    it 'creates a new blab' do
      blab = Blab.create('test blab')
      expect(blab.id).not_to be_nil
    end
  end
end
