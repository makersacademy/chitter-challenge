require 'peep_tag'
require 'peep'

describe PeepTag do
  describe '.create' do
    it 'makes an association between peeps and tags' do
      user = User.create(username: 'test_user', email: 'test@example.com', password: 'password123', name: 'test name')
      peep = Peep.create(text: 'This is the first test peep!', user_id: user.id, timestamp: "2021-02-03 04:05:06")
      tag = Tag.create(text: "#test_tag")

      peep_tag = PeepTag.create(peep_id: peep.id, tag_id: tag.id)
      expect(peep_tag.tag_id).to eq tag.id
      expect(peep_tag.peep_id).to eq peep.id
    end
  end
end
