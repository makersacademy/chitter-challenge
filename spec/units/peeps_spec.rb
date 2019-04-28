require 'peep'

RSpec.describe Peep do

  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (peep) VALUES ('My second peep!')")

      peeps = Peep.all
      expect(peeps).to include "My second peep!"
    end
  end

  describe '.post' do
    it 'posts a new peep' do
      Peep.post(peep: 'A cab')

      expect(Peep.all).to include 'A cab'
    end
  end

end
