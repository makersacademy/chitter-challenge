require 'chitter'

describe Chitter do
  describe 'self.all_peeps' do
    it 'returns all peeps as an array of peeps' do
      peeps = Chitter.all_peeps
      
      expect(peeps.last).to be_a(Peep)
      expect(peeps.first.peep_id).to eq('3')
      expect(peeps.first.message).to eq('How do you do this?')
    end
  end    

  describe 'self.all_users' do
    it 'returns all users as an array of users' do
      users = Chitter.all_users
      
      expect(users.last).to be_a(User)
      expect(users.last.user_id).to eq('3')
      expect(users.first.email).to eq('captainfrog@notadomain.com')
    end
  end  

  describe 'self.all_tags' do
    it 'returns all tags as an array of tags' do
      tags = Chitter.all_tags
      
      expect(tags.last).to be_a(Tag)
      expect(tags.last.user_id).to eq('1')
      expect(tags.first.peep_id).to eq('1')
    end
  end
end
