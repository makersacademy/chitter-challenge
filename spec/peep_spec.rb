require 'peep'
require 'user'

describe Peep do
  describe '.create' do
    it 'can add a peep to the database' do
      User.create(name: 'Amit Tauro', username: 'artauro92',
        email: 'artauro92@hotmail.com', password: 'Makers')
      user = User.find(username: 'artauro92', email: 'artauro92@hotmail.com')
      Peep.create(message: 'new message', user_id: user.id, user_name: user.name)
      expect(Peep.all).to all(be_instance_of(Peep))
    end
  end
end
