require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'describes the peeps' do
      user = User.create(email: "right@email.com", password: "Any123", name: "Bill Test", username: "Billtest")
      test = Peep.create(text: 'Test 1', user_id: user.id)
      Peep.create(text: 'Test 2', user_id: user.id)
      Peep.create(text: 'Test 3', user_id: user.id)

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.last.id).to eq test.id
      expect(peeps.first.text).to eq 'Test 3'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      user = User.create(email: "right@email.com", password: "Any123", name: "Bill Test", username: "Billtest")
      peep = Peep.create(text: 'Test 1', user_id: user.id)
      persisted_data = peep_persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.text).to eq 'Test 1'
    end
  end
end
