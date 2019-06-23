require './lib/models/user.rb'

RSpec.describe User do

  describe '#.create' do
    it 'craete a user' do
      User.create(email: 'nnn@mail.com', password: 'ccffrr', name: 'name', user_name: 'username')
      user = User.all[0]
      
      expect(user.email).to eq('nnn@mail.com')
      expect(user.password).to eq('ccffrr')
      expect(user.name).to eq('name')
      expect(user.user_name).to eq('username')
    end
  end
end

