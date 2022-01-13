require 'tag'
require 'database_helpers'

describe Tag do

  describe '.create' do
    it 'creates a new tag' do
      tag = Tag.create(text: "#test_tag")
      
      persisted_data = persisted_data(table: :tags, id: tag.id)

      expect(tag).to be_a Tag
      expect(tag.id).to eq persisted_data.first['id']
      expect(tag.text).to eq '#test_tag'
    end

    it 'does not create duplicates' do
      tag = Tag.create(text: "#test_tag")
      tag2 = Tag.create(text: "#test_tag")
      expect(tag2.id).to eq tag.id
      expect(tag2.text).to eq tag.text
    end
  end

  describe '.all' do
    it 'returns a list of all tags' do
      tag = Tag.create(text: "#test_tag")
      tag2 = Tag.create(text: "#test_tag2")

      tags = Tag.all

      expect(tags.length).to eq 2
      expect(tags.first).to be_a Tag
      expect(tags.first.text).to eq '#test_tag'
    end
  end
end
