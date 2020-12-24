require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      user = User.sign_up(username: 'Kiki', email: 'kiki@chitter.com')
      peep = Peep.create(text: 'First tester', user_id: user.id)
      Peep.create(text: 'Second tester', user_id: user.id)
      Peep.create(text: 'Third tester', user_id: user.id)

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_kind_of Peep
      expect(peeps.first.text).to eq 'First tester'
      expect(peeps.first.id).to eq peep.id
    end
  end

  describe '.create' do
    it 'creates a peep' do
      user = User.sign_up(username: 'Kiki', email: 'kiki@chitter.com')
      peep = Peep.create(text: 'New peep', user_id: user.id)
      persisted_data = persisted_data(id: peep.id, table: 'peeps')

      expect(peep).to be_kind_of Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.text).to eq 'New peep'
    end
  end

  describe '#time' do
    it 'stores timestamp' do
      user = User.sign_up(username: 'Kiki', email: 'kiki@chitter.com')
      peep = Peep.create(text: 'Timestamp tester', user_id: user.id)
      persisted_data = persisted_data(id: peep.id, table: 'peeps')

      expect(peep.text).to eq 'Timestamp tester'
      expect(peep.timestamp).to eq persisted_data.first['timestamp']
    end
  end
end
