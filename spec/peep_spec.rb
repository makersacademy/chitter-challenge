# frozen_string_literal: true

require 'peep'
require 'user'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      PG.connect(dbname: 'chitter_test')

      user = User.create(email: 'test@example.com', password: 'password123', username: 'Jane Doe', name: 'Jane')
      peep = Peep.create(text: 'This is a test', user_id: user.id)
      Peep.create(text: 'This is also a test', user_id: user.id)

      peeps = Peep.all
      persisted_data(table: 'peeps', id: peep.id)

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.text).to eq 'This is a test'
      expect(peeps.first.user_id).to eq user.id
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      user = User.create(email: 'test@example.com', password: 'password123', username: 'Jane Doe', name: 'Jane')
      peep = Peep.create(text: 'This is a test', user_id: user.id)
      persisted_data = persisted_data(table: 'peeps', id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.text).to eq 'This is a test'
      expect(peep.user_id).to eq user.id
    end
  end

  describe '.where' do
    it 'gets the relevant id number from the user database' do
      user = User.create(email: 'test@example.com', password: 'password123', username: 'Jane Doe', name: 'Jane')
      Peep.create(text: 'This is a test', user_id: user.id)
      Peep.create(text: 'This is a second test', user_id: user.id)
  
      peeps = Peep.where(user_id: user.id)
      peep = peeps.first
      persisted_data(table: 'peeps', id: peep.id)
  
      expect(peep.user_id).to eq user.id
    end
  end

  let(:user_class) { double(:user_class) }

  describe '#users' do
    it 'calls .where on the User class' do
      user = User.create(email: 'test@example.com', password: 'password123', username: 'Jane Doe', name: 'Jane')
      peep = Peep.create(text: 'This is a test', user_id: user.id)
      expect(user_class).to receive(:where).with(user_id: user.id)

      peep.users(user_class)
    end
  end

end
