require 'peep'

describe Chitter do
  
  describe '.feed' do
    it 'returns peeps' do
      connection = PG.connect(dbname: 'chitter_test_spec')

      connection.exec("INSERT INTO chitter_peeps (peep) VALUES ('Makers is great');")
      connection.exec("INSERT INTO chitter_peeps (peep) VALUES ('Life is good');")
      connection.exec("INSERT INTO chitter_peeps (peep) VALUES ('Coding is fun');")
      chitter = Chitter.feed
      expect(peep).to include "Makers is great"
      expect(peep).to include "Life is good"
      expect(peep).to include "Coding is fun"
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Chitter.create(peep: "Makers is fun")

      expect(Chitter.feed). to include "Makers is fun"
    end
  end
end