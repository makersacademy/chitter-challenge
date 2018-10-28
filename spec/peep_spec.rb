require 'peep'
require 'user'
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
      Peep.create(text: 'My peep message', user_id: "#{user.id}")
    end
  end

  describe '.all' do
    it 'returns all peeps in reverse chronological order' do
      user = User.create(name: 'John', username: 'john', email: 'john@example.com', password: 'password123')
      peep1 = Peep.create(text: 'My peep message', user_id: "#{user.id}")
      peep2 = Peep.create(text: 'My peep message2', user_id: "#{user.id}")
      
      peeps = Peep.all
      expect(peeps.length).to eq 2
      expect(peeps.first.text).to eq peep2.text
      expect(peeps.first.id).to eq peep2.id
    end
  end

  describe '.timestamp' do
    let(:time) { double :time, strftime: "12:00"}
    it 'creates a timestamp from a current time' do
      allow(Time).to receive(:new).and_return(time)
      timestamp = Peep.timestamp
      expect(timestamp).to eq "12:00"
    end
  end

  describe '.where' do
    it 'returns peeps from a specific user' do
      john = User.create(name: 'John', username: 'john', email: 'john@example.com', password: 'password123')
      Peep.create(text: "Johns peep", user_id: john.id)
      john_peeps_data = DatabaseConnection.query("SELECT * FROM peeps WHERE user_id = '#{john.id}'").to_a
      john_peeps = Peep.where(user_id: john.id)

      expect(john_peeps.length).to eq john_peeps_data.length
      expect(john_peeps.first).to be_a Peep
      expect(john_peeps.first.text).to eq "Johns peep"
      expect(john_peeps.first.user_id).to eq john.id
    end
  end

  describe '#username' do
    it 'returns the username of the owner of the peep' do
      john = User.create(name: 'John', username: 'john', email: 'john@example.com', password: 'password123')
      peep = Peep.create(text: "Johns peep", user_id: john.id)
      expect(peep.username).to eq 'john'
    end
  end
end
