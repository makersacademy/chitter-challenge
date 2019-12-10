require 'peep'
require 'database_helpers'

describe Peep do

  describe '.all' do
    it 'returns all the peeps' do
      user = User.create(email: 'jess@test.com', password: 'abcdef', handle: 'jesstest')
      peep = Peep.create(message: 'This is a test peep', user_id: user.id)
      Peep.create(message: 'This is a test peep 2', user_id: user.id)

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peep).to be_a Peep
      expect(peep.message).to eq 'This is a test peep'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      user = User.create(email: 'jess@test.com', password: 'abcdef', handle: 'jesstest')
      peep = Peep.create(message: 'test message', user_id: user.id)

      persisted_data = persisted_data(table: 'peeps', id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.message).to eq 'test message'

    end
  end
end
