require 'peep'
require 'user' 

describe Peep do

    describe 'create a Peep' do
      it 'when sending the create message to Peep class' do
        user = User.create(name: 'My_name', username: 'My_username', email: 'someemail@gmail.com', password: 'fefwefwe')
        peep = Peep.create(user_id: user.id , peep: 'Some peep')
        expect(peep.peep).to eq 'Some peep'

      end
    end

end