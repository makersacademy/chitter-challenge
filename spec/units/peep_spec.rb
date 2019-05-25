require 'peep'

describe Peep do
  describe '.send' do
      it 'sends a new peep' do
        Peep.send(message: "Hello there")
        connection = PG.connect(dbname: 'chitter_test')
        result = connection.exec "SELECT * FROM peeps;"

        expect(result.first['message']).to eq "Hello there"
      end
  end
end
