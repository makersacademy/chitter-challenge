require 'peep'
require 'user'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      user = User.create(email: 'test@test.com', name: 'test', password: 'password123', username: 'testing')
      Peep.create(content: 'Hello world!', user: user)
      Peep.create(content: 'Hello Makers!', user: user)
      Peep.create(content: 'Hello Cheese!', user: user)

      peeps = Peep.all
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
    end
  end

  describe '.create' do
    it 'creates a Peep after adding a peep to the database' do
      user = User.create(email: 'test@test.com', name: 'test', password: 'password123', username: 'testing')
      peep = Peep.create(content: 'Hello world!', user: user)

      expect(peep).to be_a Peep
      expect(peep.content).to eq 'Hello world!'
    end
  end

  describe '.find' do
    it 'finds the peep by id and returns a Peep object' do
      user = User.create(email: 'test@test.com', name: 'test', password: 'password123', username: 'testing')
      peep = Peep.create(content: 'Hello world!', user: user)

      peep2 = Peep.find(id: peep.id)

      expect(peep2).to be_a Peep
      expect(peep2.id).to eq peep.id
      expect(peep2.content).to eq 'Hello world!'
    end
  end

  describe '.update' do
    it 'updates the peep by replacing its content in the database with new values' do
      user = User.create(email: 'test@test.com', name: 'test', password: 'password123', username: 'testing')
      peep = Peep.create(content: 'Hello world!', user: user)

      newpeep = Peep.update(id: peep.id, content:'Hello again!')
      persisted_data = persisted_data(table: 'peeps', id: newpeep.id)

      expect(persisted_data.first['id']).to eq peep.id
      expect(persisted_data.first['content']).to eq 'Hello again!'
      expect(newpeep.id).to eq peep.id
    end
  end
end
