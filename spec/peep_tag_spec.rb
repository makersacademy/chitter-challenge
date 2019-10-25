require 'peep_tag'

describe PeepTag do
  let(:time) { "12:12:12" }
  describe '.create' do
    it 'creates a link between a bookmark and a tag' do
      peep = Peep.create(time_stamp: time, message: "I am bored right now")
      tag = Tag.create(content: 'test tag')

      peep_tag = PeepTag.create(peep_id: peep.id, tag_id: tag.id)

      expect(peep_tag).to be_a PeepTag
      expect(peep_tag.tag_id).to eq tag.id
      expect(peep_tag.peep_id).to eq peep.id
    end
  end
end
