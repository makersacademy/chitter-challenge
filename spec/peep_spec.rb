require 'peep'

describe Peep do
  describe '.all' do
    it 'reurns an array of peeps from database starting at oldest' do
      user = User.create(name: 'John', username: 'John1', email: 'john@test.com',
      password: 'password123')
      Peep.create(text: 'first peep', user_id: user.id)
      Peep.create(text: 'second peep', user_id: user.id)
      peep_three = Peep.create(text: 'third peep', user_id: user.id)

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep_three.id
      expect(peeps.first.text).to eq 'third peep'
    end
  end

  describe '.create' do
    it 'creates and returns a new peep' do
      user = User.create(name: 'John', username: 'John1', email: 'john@test.com',
      password: 'password123')
      peep = Peep.create(text: 'test peep', user_id: user.id)

      expect(peep).to be_a Peep
      expect(peep.text).to eq 'test peep'
    end
  end
end
