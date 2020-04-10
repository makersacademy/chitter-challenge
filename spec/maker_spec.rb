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
end