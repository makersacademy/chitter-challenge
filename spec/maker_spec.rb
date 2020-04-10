require 'maker'
require 'db_connection'

describe Maker do
  describe '.create' do
    it 'adds a maker to the database and returns it' do
      maker = Maker.create('Phil', 'Squirrel', 'here@there.com', '1234')
      DBConnection.connect
      maker_in_db = DBConnection.run_query("SELECT * FROM makers WHERE id = #{maker.id};")
      DBConnection.disconnect

      expect(maker.id).to eq maker_in_db.first['id']
      expect(maker.name).to eq 'Phil'
      expect(maker.username).to eq 'Squirrel'
      expect(maker.email).to eq 'here@there.com'
    end
  end

  describe '.find' do
    it 'finds the maker with the specified id from the database' do
      maker = Maker.create('Phil', 'Squirrel', 'here@there.com', '1234')
      maker_in_db = Maker.find(maker.id)
      
      expect(maker_in_db.id).to eq maker.id
      expect(maker_in_db.name).to eq 'Phil'
      expect(maker_in_db.username).to eq 'Squirrel'
      expect(maker_in_db.email).to eq 'here@there.com'
    end
  end
end
