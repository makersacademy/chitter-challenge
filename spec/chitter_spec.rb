require 'chitter'

describe Chitter do

  describe '.all' do

    it 'returns all the chits' do
      connection = PG.connect(dbname: 'chitter')

      Chitter.add('@deanlewis', 'My first chit')

      chitters = Chitter.new

      expect(chitters.length).to eq 1
      expect(chitters).to include(['@deanlewis', 'My first chit'])
      
    end

  end

end
