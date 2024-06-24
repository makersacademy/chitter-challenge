
require 'peeps'

describe Peep do
  describe '#self.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (content) VALUES('This is my first peep');")
      connection.exec("INSERT INTO peeps (content) VALUES('This is my middle peep');")
      connection.exec("INSERT INTO peeps (content) VALUES('Bye now - this is my last peep');")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps[0].content).to eq 'This is my first peep'

    end 
  end

  describe '#create' do
    it 'creates a new peep' do
      peep = Peep.create(content: 'This is my next peep')
      key = peep.id
      conn = PG.connect(dbname: 'chitter_test')
      feedback = conn.query("SELECT * FROM peeps WHERE id = #{key};")

      expect(peep).to be_a Peep
      expect(key).to eq feedback.first["id"]
      expect(peep.content).to eq 'This is my next peep'
    end
  end
end
