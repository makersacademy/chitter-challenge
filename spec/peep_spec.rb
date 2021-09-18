require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (user_id, body) VALUES(1, 'The real Ronaldo is the first user of this amazing app')")
      connection.exec("INSERT INTO peeps (user_id, body) VALUES(2, 'Hey Ronnie, wanna go dribble half of France together?');")
      connection.exec("INSERT INTO peeps (user_id, body) VALUES(1, 'Yeah, why not');")
      
      peeps = Peep.all

      expect(peeps).to include 'The real Ronaldo is the first user of this amazing app'
      expect(peeps).to include 'Hey Ronnie, wanna go dribble half of France together?'
      expect(peeps).to include 'Yeah, why not'
    end
  end
end