require 'peep'

describe Peep do

  let(:database_connection) { DatabaseConnection }
  subject(:peep) {described_class.new(id: 1, text: "test peep", user_id: 1, time: '24.04.2018 12:24')}

  describe '#initialize' do
    it 'creates new instance of peep' do
      expect(peep.id).to eq 1
      expect(peep.text).to eq 'test peep'
      expect(peep.user_id).to eq 1
      expect(peep.time).to eq '24.04.2018 12:24'
    end
  end

  describe '.all' do
    it 'returns all peeps from database' do
      user1 = User.create(email: "jonny@gmail.com", password: "pass123", user_name: "jonny", name: "Jon")
      peep1 = described_class.create(text: 'test peep', user_id: user1.id, time: '#{current_timestamp(0)}')
      peep2 = described_class.create(text: 'another test peep', user_id: user1.id, time: '#{current_timestamp(0)}')
      peeps = described_class.all
      texts = peeps.map(&:text)
      expect(texts).to include 'test peep'
      expect(texts).to include 'another test peep'
    end
  end

  describe '.create' do
    it 'creates a record in a database' do
      user1 = User.create(email: "jonny@gmail.com", password: "pass123", user_name: "jonny", name: "Jon")
      peep1 = described_class.create(text: 'test peep', user_id: user1.id, time: '#{current_timestamp(0)}')
      expect(peep1.id).not_to be_nil
      expect(peep1.user_id).to eq user1.id
    end
  end

end
