require 'peep_tag'

describe PeepTag do
  describe '.create' do
    it 'creates a link between a peep and a tag' do
      user = User.create(username: "kim", email: 'test@example.com', password: 'password123')
      peep = Peep.create(peep: "Greetings", user_id: user.id)
      tag = Tag.create(content: 'test tag')

      peep_tag = PeepTag.create(peep_id: peep.id, tag_id: tag.id)

      expect(peep_tag).to be_a PeepTag
      expect(peep_tag.tag_id).to eq tag.id
      expect(peep_tag.peep_id).to eq peep.id
    end
  end
end