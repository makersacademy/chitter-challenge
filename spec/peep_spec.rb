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
  let(:content_two) { "I'm posting more stuff" }
  let(:content_three) { "And even more stuff" }

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
    it 'displays all peeps on the index page' do
      Peep.create(content: content, user_id: user.id)
    end

    it 'displays peeps in reverse chronological order' do
      #
    end
  end

end
