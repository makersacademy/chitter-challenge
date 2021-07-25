require 'peep'
require 'database_helpers'

describe Peep do
  describe '.create' do
    it 'creates a new peep' do
      user = User.create(
        name: 'Example Name',
        username: 'exampleusername',
        email: 'example@example.com',
        password: 'examplepassword'
      )
      peep = Peep.create(text: 'Here is a test peep', user_id: user.id)
      persisted_data = persisted_data(id: peep.id, table: 'peeps')

      expect(peep).to be_a(Peep)
      expect(peep.id).to eq(persisted_data['id'])
      expect(peep.text).to eq('Here is a test peep')
      expect(peep.time).to eq(persisted_data['time'])
      expect(peep.user.id).to eq(user.id)
    end
  end

  describe '.all' do
    it 'returns all peeps' do
      user = User.create(
        name: 'Example Name',
        username: 'exampleusername',
        email: 'example@example.com',
        password: 'examplepassword'
      )
      peep = Peep.create(text: 'Test peep', user_id: user.id)
      Peep.create(text: 'Second test peep', user_id: user.id)
      Peep.create(text: 'Third test peep', user_id: user.id)
      peeps = Peep.all

      expect(peeps.length).to eq(3)
      expect(peeps.first).to be_a(Peep)
      expect(peeps.first.id).to eq(peep.id)
      expect(peeps.first.time).to eq(peep.time)
      expect(peeps.first.text).to eq(peep.text)
      expect(peeps.first.user.id).to eq(peep.user.id)
    end
  end
end
