require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps in an array' do
      connection = PG.connect(dbname: 'chitter_test')
      
      # connection.exec("INSERT INTO bookmarks VALUES(1, 'finn_the_human', 'Finn', 'Mathematical!');")

      expected_peeps = [
        'Mathematical!'
      ]

      expect(Peep.all).to eq expected_peeps
    end
  end
end
