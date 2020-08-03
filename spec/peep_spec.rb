require 'peep'
require 'user'
require 'database_helpers'

describe Peep do
  
  describe '.all' do
    it 'returns a list of peeps' do
      user = User.create(
        username: 'FirstAuthor',
        email: 'test@makers.com',
        password: '12345'
      )
      peep = Peep.create(text: 'Test peep text', user_id: user.id)
      peeps = Peep.all
      
      expect(peeps.length).to eq 1
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq user.id
      expect(peep.text).to eq 'Test peep text'
      expect(peep.user_id).to eq user.id
      expect(peep.id).to eq '1'
    end
  end

  describe '.create' do
    it 'adds a new peep to the database' do
      user = User.create(
        username: 'FirstAuthor',
        email: 'test@makers.com',
        password: '12345'
      )
      peep = Peep.create(text: 'Test peep text', user_id: user.id)
      persisted_data = persisted_data(table: 'peeps', id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.text).to eq 'Test peep text'
      expect(peep.timestamp).to eq persisted_data['timestamp']
      expect(peep.user_id).to eq user.id 
    end
  end
end
