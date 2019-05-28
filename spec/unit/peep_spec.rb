# TO DO: pending mocking for USER

require 'peep'
require 'user' 

describe Peep do 

  describe '.create' do
    it 'create a Peep class when sending the create message to Peep class' do
      user = User.create(name: 'My_name', username: 'My_username', email: 'someemail@gmail.com', password: 'fefwefwe')
      peep = Peep.create(user_id: user.id, peep: 'Some peep')
      expect(peep.peep).to eq 'Some peep'
    end
  end

  describe '.all' do 
    it 'retrieves all peeps from the db' do
      user = User.create(name: 'My_name', username: 'My_username', email: 'someemail@gmail.com', password: 'fefwefwe')
      Peep.create(user_id: user.id, peep: 'Some peep 0')
      # peep2 = Peep.create(user_id: user.id , peep: 'Some peep 1')
      # peep3 = Peep.create(user_id: user.id , peep: 'Some peep 2')
      expect(Peep.all[0]['peep']).to eq 'Some peep 0'
    end

  end

end
