describe Tag do
  describe '.check' do
    context 'given a peep' do
      it 'returns a tag if required' do
        user, peep = tag_user
        expect(Tag.find_by(user_id: user.id)).to be_a Tag
      end
    end

    context 'given a peep with an invalid tag' do
      it 'returns nil' do
        new_user
        user = User.find_by(name: "Guy")
        new_user('Ben', 'ben', 'ben@mail.com')
        peep = Peep.create(content: '@frank tagged', user_id: user.id)
        expect(Tag.check(peep)).to eq nil
        expect(Tag.find_by(user_id: user.id)).to eq nil
      end
    end
  end
  
  describe '#read!' do
    it 'sets a tag as read' do
      user, peep = tag_user
      tag = Tag.user_tags(user.id)[:unread].first
      
      expect(tag).to_not be_read
      tag.read!

      tag = Tag.find_by_id(tag.id)
      expect(tag).to be_read
    end
  end
  
  describe '.user_tags' do
    context 'given a user id' do
      it 'returns a hash of read and unread tags' do
        user, peep = tag_user
        expect(Tag.user_tags(user.id)).to be_a Hash
        expect(Tag.user_tags(user.id)[:unread].first).to be_a Tag
      end
    end
  end
  
  describe '#peep' do
    it 'returns the tags peep' do
      user, peep = tag_user
      tag = Tag.user_tags(user.id)[:unread].first
      expect(tag.peep).to be_a Peep
      expect(tag.peep.content).to eq "@guy tagged"
    end
  end
end