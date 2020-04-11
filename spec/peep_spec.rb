require 'peep'
require 'db_connection'
require 'maker'

describe Peep do
  describe '.all' do
    it 'returns a list of all peeps' do
      maker = Maker.create('Phil', 'Squirrel', 'here@there.com', '1234')
      Peep.create('My first peep', Time.now, maker.id)
      Peep.create('My second peep', Time.now, maker.id)
      peeps = Peep.all
      
      expect(peeps.length).to eq 2
      expect(peeps[0].text).to eq 'My first peep'
      expect(peeps[1].text).to eq 'My second peep' 
    end
  end

  describe '.create' do
    it 'adds a peep to the database and returns it' do
      maker = Maker.create('Phil', 'Squirrel', 'here@there.com', '1234')
      time = Time.now
      peep = Peep.create('My first peep', time, maker.id)
      
      DBConnection.connect
      peep_in_db = DBConnection.run_query("SELECT * FROM peeps WHERE id =#{peep.id};")
      DBConnection.disconnect

      expect(peep.id).to eq peep_in_db.first['id']
      expect(peep.text).to eq 'My first peep'
      expect(peep.time).to eq time.strftime('%Y-%m-%d %H:%M:%S')
      expect(peep.maker.id).to eq maker.id
      expect(peep.maker.name).to eq maker.name
      expect(peep.maker.username).to eq maker.username
    end
  end
end
