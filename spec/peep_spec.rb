require 'peep'
require 'persisted_data_helpers'

describe Peep do
  describe 'all' do
    it 'should show all peeps' do
      user = User.sign_up(email: 'test@example.com', password: 'password123', username: 'apple123', name: 'tasha')
      user2 = User.sign_up(email: 'hello@example.com', password: 'password1234', username: 'apple1234', name: 'anouska')
      Peep.post(post: "my first peep!", user_id: user.id)
      Peep.post(post: "also my first peep!", user_id: user2.id)
      peeps = Peep.all
      expect(peeps[0].name).to include("tash")
      expect(peeps[1].name).to include("anouska")
    end
  end
  describe 'post' do
    it 'creates a new post' do
      user = User.sign_up(email: 'test@example.com', password: 'password123', username: 'apple123', name: 'tasha')
      peep = Peep.post(post: 'testing post', user_id: user.id)
      persisted_data = persisted_data(table: 'peeps', id: peep.id )
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.post).to eq 'testing post'
      expect(peep.user_id).to eq user.id
    end
  end
end
