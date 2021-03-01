require 'peep'

describe Peep do
  let(:user_class) { double(:user_class) }
  describe '.all' do
    it 'lists peeps in descending time order' do
      user = User.create(email: 'bobloblaw@lawblog.com', password: 'bobloblawslawblog', name: 'Bob Loblaw', username: 'bloblaw')
      user2 = User.create(email: 'jeaninvestigates@jeangenie.com', password: 'masterofdisguise', name: 'Jean Parmigian', username: 'Jeeeeeean')
      Peep.create(content: 'Check out my law blog!', date: '2021-02-28', time: '02:25', user_id: user.id)
      Peep.create(content: 'Who needs something investigated?', date: '2021-01-14', time: '18:20', user_id: user2.id)
      peeps = Peep.all
      expect(peeps.first.content).to eq('Check out my law blog!')
      expect(peeps.last.content).to eq('Who needs something investigated?')
    end
  end
  describe '.create' do
    it 'adds a peep to the table and returns a peep object with content, time, and username' do
      user = User.create(email: 'bobloblaw@lawblog.com', password: 'bobloblawslawblog', name: 'Bob Loblaw', username: 'bloblaw')
      peep = Peep.create(content: 'Check out my law blog!', date: '2021-02-28', time: '02:25', user_id: user.id)
      persisted_data = persisted_peep_data(id: peep.id)
      expect(persisted_data['id']).to eq("#{peep.id}")
      expect(peep.user_id).to eq(user.id)
      expect(peep).to be_a Peep
      expect(peep.content).to eq "Check out my law blog!"
    end
  end
  describe 'peeped_by' do
    it 'returns the name of the user who peeped it' do
      user = User.create(email: 'bobloblaw@lawblog.com', password: 'bobloblawslawblog', name: 'Bob Loblaw', username: 'bloblaw')
      peep = Peep.create(content: 'Check out my law blog!', date: '2021-02-28', time: '02:25', user_id: user.id)
      allow(user_class).to receive(:find).with(id: user.id).and_return(user)
      expect(user_class).to receive(:find).with(id: peep.user_id)
      peep.peeped_by(user_class)
    end
  end
  describe 'username' do
    it 'returns the username of the user who peeped it' do
      user = User.create(email: 'bobloblaw@lawblog.com', password: 'bobloblawslawblog', name: 'Bob Loblaw', username: 'bloblaw')
      peep = Peep.create(content: 'Check out my law blog!', date: '2021-02-28', time: '02:25', user_id: user.id)
      allow(user_class).to receive(:find).with(id: user.id).and_return(user)
      expect(user_class).to receive(:find).with(id: peep.user_id)
      peep.username(user_class)
    end
  end

end
