require 'peep'
require 'test_helpers'

describe Peep do

  describe '.create' do
    it 'creates a new peep from a user' do
      user = User.create(name: 'John', username: 'john', email: 'john@example.com', password: 'password123')
      peep = Peep.create(text: 'My peep message', user_id: "#{user.id}")
      persisted_data = persisted_data(id: peep.id, table: 'peeps').first
      
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.text).to eq 'My peep message'
    end

    it 'calls .timestamp for time' do
      user = User.create(name: 'John', username: 'john', email: 'john@example.com', password: 'password123')
      expect(Peep).to receive(:timestamp)
      peep = Peep.create(text: 'My peep message', user_id: "#{user.id}")
    end
  end

  describe '.all' do
    it 'creates a returns all peeps' do
      user = User.create(name: 'John', username: 'john', email: 'john@example.com', password: 'password123')
      peep1 = Peep.create(text: 'My peep message', user_id: "#{user.id}")
      peep2 = Peep.create(text: 'My peep message2', user_id: "#{user.id}")
      
      peeps = Peep.all
      expect(peeps.length).to eq 2
      expect(peeps.first.text).to eq peep1.text
      expect(peeps.first.id).to eq peep1.id
    end
  end

  describe '.timestamp' do
    it 'creates a timestamp from a current time' do
      timestamp = Peep.timestamp
      expect(timestamp).to eq "#{Time.new.strftime("%H:%M")}"
    end
  end
end
