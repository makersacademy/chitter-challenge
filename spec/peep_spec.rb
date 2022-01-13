require 'database_helpers'
require 'peep'

describe Peep do

  describe '.create' do
    it 'creates a new peep' do
      user = User.create(username: 'test_user', email: 'test@example.com', password: 'password123', name: 'test name')
      peep = Peep.create(text: 'This is the first test peep!', user_id: user.id, timestamp: "2021-02-03 04:05:06")

      persisted_data = persisted_data(table: :peeps, id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.text).to eq 'This is the first test peep!'
      expect(peep.user_id).to eq user.id
      expect(peep.time).to eq "2021-02-03 04:05:06"
    end
  end
end
