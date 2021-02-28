require 'peep'
require 'user'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      user = User.create(email: 'test@test.com', name: 'test', password: 'password123', username: 'testing' )
      peep = Peep.create(content: 'Hello world!', user: user)
      Peep.create(content: 'Hello Makers!', user: user)
      Peep.create(content: 'Hello Cheese!', user: user)

      peeps = Peep.all
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.content).to eq 'Hello Cheese!'
    end
  end

  describe '.create' do
    it 'creates a Peep after adding a peep to the database' do
      user = User.create(email: 'test@test.com', name: 'test', password: 'password123', username: 'testing' )
      peep = Peep.create(content: 'Hello world!', user: user)

      expect(peep).to be_a Peep
      expect(peep.content).to eq 'Hello world!'
    end
  end
end
