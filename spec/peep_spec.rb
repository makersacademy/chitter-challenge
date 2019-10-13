require 'peep'
require 'user'
require_relative 'database_helpers'

describe Peep do

  # Test user account details
  let(:email) { 'test@example.com' }
  let(:password) { 'pass123' }
  let(:name) { 'Melvin Lau' }
  let(:username) { 'melvinlau' }

  # Create a test user account in the database
  let(:user) {
    User.create(
      email: email,
      password: password,
      name: name,
      username: username
      )
  }

  # Test content
  let(:content_one) { "Hello world! Whassup y'all?" }
  let(:content_two) { "I'm bored!" }

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(content: content_one, user_id: user.id)
      persisted_data = database(table: 'peeps', id: peep.id)
      expect(peep.content).to eq persisted_data[0]['content']
      expect(peep.user_id).to eq persisted_data[0]['user_id']
      expect(peep.timestamp).to be_a String
    end
  end

  describe '.all' do
    it 'returns a list of peeps in reverse-chronological order' do
      peep_one = Peep.create(content: content_one, user_id: user.id)
      peep_two = Peep.create(content: content_two, user_id: user.id)
      expect(Peep.all.length).to eq 2
      expect(Peep.all[0].content).to eq content_two
      expect(Peep.all[1].content).to eq content_one
      expect(Peep.all[0].user.name).to eq name
    end
  end

  describe '.delete' do
    it 'deletes a peep' do
      peep = Peep.create(content: content_one, user_id: user.id)
      Peep.delete(id: peep.id)
      expect(Peep.all).not_to include peep
    end
  end

end
