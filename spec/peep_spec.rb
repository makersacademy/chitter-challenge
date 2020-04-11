require 'peep'
require 'db_connection'

describe Peep do
  let(:maker) { double(:maker, name: 'Phil', id: 1, username: 'Squirrel') }
  let(:maker_class) { double(:Maker, find_by_id: maker) }

  before do
    DBConnection.connect
    @result = DBConnection.run_query("INSERT INTO makers (name, user_name, email, password) VALUES($$Phil$$, $$Squirrel$$, $$here@there.com$$, $$1234$$) RETURNING id;")
    DBConnection.disconnect
  end

  describe '.all' do
    it 'returns a list of all peeps' do
      Peep.create('My first peep', Time.now, @result[0]['id'], maker_class)
      Peep.create('My second peep', Time.now, @result[0]['id'], maker_class)
      peeps = Peep.all(maker_class)
      
      expect(peeps.length).to eq 2
      expect(peeps[0].text).to eq 'My first peep'
      expect(peeps[1].text).to eq 'My second peep' 
    end
  end

  describe '.create' do
    it 'adds a peep to the database and returns it' do
      time = Time.now
      peep = Peep.create('My first peep', time, @result[0]['id'], maker_class)

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

  describe '.find_by_id' do
    it 'finds the peep with the specified id from the database' do
      peep = Peep.create('My first peep', Time.now, @result[0]['id'], maker_class)
      peep_in_db = Peep.find_by_id(peep.id)

      expect(peep_in_db.id).to eq peep.id
      expect(peep_in_db.text).to eq peep.text
      expect(peep_in_db.time).to eq peep.time
    end
  end
end
