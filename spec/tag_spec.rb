require 'tag'

describe Tag do
  describe 'self.new_tag' do
    it 'creates a new tag on the database and a instance of Tag' do
      tag = Tag.new_tag('1', '3')

      stored_data = stored_tag(table: 'tags', tag_id: tag.tag_id)
      
      expect(tag).to be_a(Tag)
      expect(tag.user_id).to eq(stored_data.first['user_id'])
      expect(tag.tag_id).to eq(stored_data.first['tag_id'])
      expect(tag.peep_id).to eq(stored_data.first['peep_id'])
    end
  end

  describe 'Contains the data for a tag' do
    it "has an id, user_id and peep_id" do
      tag = Tag.new(tag_id: '1', user_id: '2', peep_id: '3')
      expect(tag).to respond_to(:peep_id)
      expect(tag).to respond_to(:tag_id)
      expect(tag).to respond_to(:user_id)
    end
  end
end
