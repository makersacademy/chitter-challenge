require 'peep'

describe Peep do
  describe '#all' do
    it 'returns an array of peeps' do
      peeps = [
        'My first peep yoooo',
        'Just got this peep app! unbelievable!',
        'Peep is kicking off!'
      ]
      expect(described_class.all).to eq peeps
    end
  end
end
