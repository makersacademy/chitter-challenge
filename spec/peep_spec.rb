require "peep"

describe Peep do

  describe '.all' do
    it 'describes the peeps' do
      user = User.create(email: "sean2@email.com", password: "password1234", name: "Sean Test1", username: "Seantest1")
      new_peep = Peep.create(text: "Hello", user_id: user.id)
      Peep.create(text: 'Test 2', user_id: user.id)
      Peep.create(text: 'Test 3', user_id: user.id)

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      # expect(peeps.last.id).to eq test.id
      expect(peeps.first.text).to eq 'Test 3'
    end
  end

  describe '.create'  do
    it 'creates a new peep' do
      user = User.create(email: "sean2@email.com", password: "password1234", name: "Sean Test1", username: "Seantest1")
      new_peep = Peep.create(text: "Hello", user_id: user.id)
      # persisted_data = peep_persisted_data(id: peep.id)

      expect(new_peep.text).to eq("Hello")
      # expect(new_peep.user_id).to eq persisted_data['id']
      expect(new_peep).to be_a(Peep)
    end
  end
end
