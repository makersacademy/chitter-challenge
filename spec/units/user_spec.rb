require 'user'

RSpec.describe User do

  describe '#signup' do
    it 'new user can sign up' do
      new_user = User.signup(username: "brooke", password: "password")
      expect(new_user.username).to eq('brooke')
      expect(new_user.password).to eq('password')
    end

  end

end
