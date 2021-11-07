require 'peep_tag'

describe PeepTag do
  describe '.create' do
    it 'creates a link between a peep and a tag' do
      peep = Peep.create(peep: "Greetings")
      tag = Tag.create(content: 'test tag')

      peep_tag = PeepTag.create(peep_id: peep.id, tag_id: tag.id)

      expect(peep_tag).to be_a PeepTag
      expect(peep_tag.tag_id).to eq tag.id
      expect(peep_tag.peep_id).to eq peep.id
    end
  end
end