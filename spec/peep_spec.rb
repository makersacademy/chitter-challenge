require 'peep'
require 'pg'

describe Peep do
  describe '.all' do
    it 'returns a list of all peeps' do
      Peep.create('My first peep', Time.now)
      Peep.create('My second peep', Time.now)
      peeps = Peep.all
      
      expect(peeps.length).to eq 2
      expect(peeps[0].text).to eq 'My first peep'
      expect(peeps[1].text).to eq 'My second peep' 
    end
  end

  describe '.create' do
    it 'adds a peep to the database and returns it' do
      time = Time.now
      peep = Peep.create('My first peep', time)
      conn = PG.connect(dbname: 'chitter_test')
      peep_in_db = conn.exec("SELECT * FROM peeps WHERE id =#{peep.id};")
      expect(peep.id).to eq peep_in_db.first['id']
      expect(peep.text).to eq 'My first peep'
      expect(peep.time).to eq time.strftime('%Y-%m-%d %H:%M:%S')
    end
  end
end
