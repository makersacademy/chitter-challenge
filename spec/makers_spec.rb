require 'makers'

describe Makers do

  describe 'the names of the person who has submitted their registration for Chitter' do
    it 'returns the new members name' do
      makers = Makers.all
      expect(makers).to include 'Oli Le Maire'
    end
  end
end
