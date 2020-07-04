require 'peeps'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      peeps = Peep.all
      expect(peeps).to include('Hello, Twitter!')
    end
  end 
end
