require 'peep'

describe Peep do
  describe '::all' do
    it 'should return a list of peeps' do
      expect(described_class.all.first).to eq 'My first peep'
    end
  end
end
