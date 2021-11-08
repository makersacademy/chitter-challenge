require 'tag'
require 'peep'
require 'database_helpers'
require 'peep_tag'
require 'user'

describe Tag do
  let(:peep_class) { double(:peep_class) }
  
  describe '.create' do
    context 'tag does not exist' do
      it 'creates a new Tag object' do
        tag = Tag.create(content: 'test tag')
        persisted_data = persisted_data(id: tag.id, table: 'tags')

        expect(tag).to be_a Tag
        expect(tag.id).to eq persisted_data.first['id']
        expect(tag.content).to eq 'test tag'
      end
    end

    context 'tag already exists' do
      it 'returns the existing tag' do
        tag1 = Tag.create(content: 'test tag')
        tag2 = Tag.create(content: 'test tag')

        expect(tag2.id).to eq tag1.id
      end
    end
  end
  describe '.where' do
    it 'returns tags linked to the given peep id' do
      user = User.create(username: "kim", email: 'test@example.com', password: 'password123')
      peep = Peep.create(peep: "Makers Academy", user_id: user.id)
      tag1 = Tag.create(content: 'test tag 1')
      tag2 = Tag.create(content: 'test tag 2')
      
      PeepTag.create(peep_id: peep.id, tag_id: tag1.id)
      PeepTag.create(peep_id: peep.id, tag_id: tag2.id)

      tags = Tag.where(peep_id: peep.id)
      tag = tags.first

      expect(tags.length).to eq 2
      expect(tag).to be_a Tag
      expect(tag.id).to eq tag1.id
      expect(tag.content).to eq tag1.content
    end
  end
  describe '.find' do
    it 'returns a tag with the given id' do
      tag = Tag.create(content: 'test tag')

      result = Tag.find(id: tag.id)

      expect(result.id).to eq tag.id
      expect(result.content).to eq tag.content
    end
  end

  describe '#peeps' do
    it 'calls .where on the peep class' do
      tag = Tag.create(content: 'test tag')

      expect(peep_class).to receive(:where).with(tag_id: tag.id)

      tag.peeps(peep_class)
    end
  end
end