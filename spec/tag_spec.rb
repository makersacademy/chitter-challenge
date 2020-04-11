require 'tag'

describe Tag do
  describe '.create' do
    it 'adds a tag to the database and returns it' do
      maker = Maker.create('Phil', 'Squirrel', 'here@there.com', '1234')
      peep = Peep.create('A new peep, tagging #Squirrel', Time.now, maker.id)
      tag = Tag.create(maker.id, peep.id)

      DBConnection.connect
      tag_in_db = DBConnection.run_query("SELECT * FROM tags WHERE id =#{tag.id};")
      DBConnection.disconnect

      expect(tag_in_db[0]['id']).to eq tag.id
      expect(tag_in_db[0]['maker_id']).to eq tag.maker.id
      expect(tag_in_db[0]['peep_id']).to eq tag.peep.id
    end
  end
end
