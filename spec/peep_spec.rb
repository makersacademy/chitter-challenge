require 'peep'

describe Peep do
  describe '## timeline' do 
    it 'displays all peeps' do
      connection = PG.connect(dbname: 'chitter_db_test')
      connection.exec("INSERT INTO peeps (user_id, body) 
                        VALUES ('01', 'My first peep!');")  
      peeps = Peep.timeline
      p peeps

      expect(peeps.length).to eq(1)
      expect(peeps.first).to be_a(Peep)
      expect(peeps.first.user_id).to eq('01')
      expect(peeps.first.body).to eq('My first peep!')
      # expect(peeps.timestamp).to eq('2019-06-22 12:00:00')
    end
  end

  describe '## add_post' do
    it 'adds a new peep to the db' do 
      connection = PG.connect(dbname: 'chitter_db_test')
      peep = Peep.add_post('Remzilla', 'My first peep!')

      expect(peep.user_id).to eq('Remzilla')
      expect(peep.body).to eq('My first peep!')
    end
  end

  
end