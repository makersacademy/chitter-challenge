require 'peep'
require 'database_helpers'
require 'pg'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      user = User.create(username: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')
    
      # add test data and wrapping return data in an object
      peep = Peep.create(text: 'Hello I am a peep!', user_id: user.id)
      Peep.create(text: 'I too am a peep!', user_id: user.id)

      peeps = Peep.all
      
      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.text).to eq 'I too am a peep!'
     
    end
  end

  describe '.create' do
    it 'creates a peep' do
      # user = double("user", :id => 1)
      user = User.create(username: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')
      peep = Peep.create(text: 'My first peep!', user_id: user.id)
      persisted_data = persisted_data(table: 'peeps', id: peep.id)
      
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.text).to eq 'My first peep!'
      expect(peep.user_id).to eq user.id
      
      
    end
  end

end
