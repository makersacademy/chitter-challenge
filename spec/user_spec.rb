require 'user'
require 'peep'

describe User do
  describe '.create' do
    it 'adds a new user to the database' do
      user = User.create(name: 'Amit Tauro', username: 'artauro92',
        email: 'artauro92@hotmail.com', password: 'Makers')
      expect(User.all).to include(an_instance_of(User))
    end
  end

  describe '.all' do
    it 'shows all the users' do
      User.create(name: 'Amit Tauro', username: 'artauro92',
        email: 'artauro92@hotmail.com', password: 'Makers')
      User.all
      expect(User.all).to all(be_instance_of(User))
    end
  end

  describe '.find' do
    it 'finds a user' do
      User.create(name: 'Amit Tauro', username: 'artauro92',
        email: 'artauro92@hotmail.com', password: 'Makers')
      user = User.find(username: 'artauro92', email: 'artauro92@hotmail.com')
      expect(user.id.to_i).to be_instance_of(Integer)
    end
  end

  describe '.peeps' do
    it 'shows a user peeps' do
      User.create(name: 'Amit Tauro', username: 'artauro92',
        email: 'artauro92@hotmail.com', password: 'Makers')
      user = User.find(username: 'artauro92', email: 'artauro92@hotmail.com')
      Peep.create(message: 'new message', user_id: user.id, user_name: user.name)
      expect(user.peeps.pop).to be_instance_of(Peep)
    end
  end
end
