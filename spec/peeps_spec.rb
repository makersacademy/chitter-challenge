require 'peeps'
require 'user'
require 'persisted_data'

describe Peeps do
  describe '.create' do
    it 'creates a new peep' do
      user = User.create(email: 'think@yahoo.com', password: 'secret', name: 'Zelda', username: 'dog')
      peep = Peeps.create(peep: "First peep", user_id: user.id)
      id = peep.id
      persisted_data = persisted_data(table: 'peeps', id: id)

      expect(peep).to be_a Peeps
      expect(peep.peep).to eq 'First peep'
      expect(peep.id).to eq persisted_data['id']
    end
  end

  describe '.all' do
    it 'returns all the peeps from the database' do
      user = User.create(email: 'think@yahoo.com', password: 'secret', name: 'Zelda', username: 'dog')
      Peeps.create(peep: "First peep", user_id: user.id)
      Peeps.create(peep: "Second peep", user_id: user.id)
      peep = Peeps.create(peep: "Third peep", user_id: user.id)

      peeps = Peeps.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peeps
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.peep).to eq peep.peep
    end
  end

  describe '#find_username' do
    it 'returns the username of the user that creates a peep' do
      user = User.create(email: 'think@yahoo.com', password: 'secret', name: 'Zelda', username: 'dog')
      peep = Peeps.create(peep: "First peep", user_id: user.id)

      expect(peep.find_username).to eq 'dog'
    end
  end
end
