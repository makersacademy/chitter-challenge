require './lib/peep'

describe Peep do

  describe '.all' do 
    it 'returns a list of all the messages' do
      peeps = Peep.all

      expect(peeps).to include('Welcome to Makers Academy')
    end
  end

end