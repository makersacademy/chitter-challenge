require 'peep'

describe Peep do

  describe '.create' do
    it 'creates a new peep' do
      user = User.create(
        name: 'Test User',
        email: 'test@email.com',
        username: 'test username',
        password: 'password123'
      )
      peep = Peep.create(text: 'This is a test peep', user_id: user.id)

      persisted_data = persisted_data(table: 'peeps', id: peep.id )

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.text).to eq 'This is a test peep'
      expect(peep.user_id).to eq user.id
    end
  end

end
