require 'user'

RSpec.describe User do

  describe '#signup' do
    it 'new user can sign up' do
      new_user = User.signup(name: "Brooke Bloggs", email: "brooke@emailaddress.com", username: "brookebloggs", password: "password")
      expect(new_user.username).to eq('brookebloggs')
      expect(new_user.password).to eq('password')
      expect(new_user.name).to eq('Brooke Bloggs')
      expect(new_user.email).to eq('brooke@emailaddress.com')
    end

  end
end
