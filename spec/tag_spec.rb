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

  describe '.all_for_maker' do
    it 'returns all tags tagging the maker with the specified id' do
      maker = Maker.create('Phil', 'Squirrel', 'here@there.com', '1234')
      peep = Peep.create('A new peep, tagging #Squirrel', Time.now, maker.id)
      Tag.create(maker.id, peep.id)
      Tag.create(maker.id, peep.id)

      tags = Tag.all_for_maker(maker.id)

      expect(tags.length).to eq 2
      expect(tags[0].maker.id).to eq maker.id
      expect(tags[0].peep.id).to eq peep.id
    end
  end 
end
