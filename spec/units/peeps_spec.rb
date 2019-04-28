require 'peep'
require 'database_connection'

RSpec.describe Peep do

  describe '.all' do
    it 'returns a list of peeps' do
      DatabaseConnection.setup('chitter_test')

      Peep.post(peep: "hello")
      peeps = Peep.all.map {|peep| peep.peep}

      expect(peeps).to include "hello"
    end
  end

end
