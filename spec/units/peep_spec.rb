require 'peep'
require 'user'


describe Peep do
  describe '.create' do
    it 'creates a new peep' do
      user = User.create(name: 'John Smith', username: 'jsmith', email: 'john@smith.com', password: 'password')
      peep = Peep.create(user_id: user.id, peep: 'I went for a run')
      persisted_data = persisted_data(id_value: peep.user_id, id_type: 'user_id', table: 'peeps')

      expect(peep).to be_a Peep
      expect(peep.user_id).to eq persisted_data.first['user_id']
      expect(peep.peep).to eq 'I went for a run'
    end

    it 'creates a new peep with a timestamp' do
      user = User.create(name: 'John Smith', username: 'jsmith', email: 'john@smith.com', password: 'password')
      time = Time.now.strftime("%Y-%m-%d %H:%M")
      peep = Peep.create(user_id: user.id, peep: 'I ate some cake')
      expect(peep.timestamp).to eq(time)
    end
  end

  describe '.all' do
    it 'returns all peeps' do
      user = User.create(name: 'John Smith', username: 'jsmith', email: 'john@smith.com', password: 'password')
      Peep.create(user_id: user.id, peep: 'I went swimming')
      peep = Peep.create(user_id: user.id, peep: 'I walked the dog')

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.user_id).to eq peep.user_id
    end

  end
end