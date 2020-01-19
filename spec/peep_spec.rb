require 'peep'

describe Peep do
  describe '.create' do
    it 'create a peep in the database and return an instance of Peep' do
      user = User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')
      peep = Peep.create(user_id: user.id, content: 'I am the peep!')
      database_peep = PG.connect(dbname: 'chitter_test').exec("SELECT * FROM peeps WHERE id='#{peep.id}';")

      expect(peep.id).to eq database_peep[0]['id']
      expect(peep.content).to eq 'I am the peep!'
      expect(peep.user_id).to eq user.id
      expect(peep.created_on).to eq DateTime.parse(database_peep[0]['created_on']).strftime('%H:%M %d %b %Y')
    end
  end

  describe '.all' do
    it 'shows all the peeps' do
      user = User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')
      Peep.create(user_id: user.id, content: 'I am the first peep!')
      Peep.create(user_id: user.id, content: 'I am the second peep!')
      Peep.create(user_id: user.id, content: 'I am the third peep!')

      expect(Peep.all.size).to eq 3
      expect(Peep.all).to include(a_kind_of(Peep))
      expect(Peep.all.first.content).to eq 'I am the third peep!'
      expect(Peep.all.last.content).to eq 'I am the first peep!'
      expect(Peep.all[1].content).to eq 'I am the second peep!'
    end
  end

  describe '.find_by' do
    it 'shows only the peeps from a determined user' do
      user1 = User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')
      user2 = User.create(name: 'Trump', username: 'MockingTrump', email: 'mock@trump.com', password: 'psw123')
      Peep.create(user_id: user1.id, content: 'Peep 1')
      Peep.create(user_id: user2.id, content: 'I am Trump')
      Peep.create(user_id: user1.id, content: 'Peep 2')

      expect(Peep.find_by(user_id: user1.id).size).to eq 2
      expect(Peep.find_by(user_id: user2.id).size).to eq 1
      expect(Peep.find_by(user_id: user1.id).first.content).to eq 'Peep 2'
      expect(Peep.find_by(user_id: user1.id).last.content).to eq 'Peep 1'
      expect(Peep.find_by(user_id: user2.id).first.content).to eq 'I am Trump'
    end
  end
end
