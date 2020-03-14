require 'peep'

describe Peep do

  describe ".all" do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps VALUES (1, 'this is a peep about a cat');")
      connection.exec("INSERT INTO peeps VALUES (2, 'the cat is soft and fluffy');")
      connection.exec("INSERT INTO peeps VALUES (3, 'and if you die, it will eat your face');")

      peeps = Peep.all

      expect(peeps).to include('this is a peep about a cat')
      expect(peeps).to include('the cat is soft and fluffy')
      expect(peeps).to include('and if you die, it will eat your face')
    end
  end
end
