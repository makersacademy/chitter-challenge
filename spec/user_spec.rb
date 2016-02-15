require_relative '../app/models/user'

describe 'User' do
  subject(:user){User.create(name: 'Emma', username: 'emmab', email: 'emma@email.com', password: 'password', password_confirmation: 'password')}

  describe '#authenticate' do

    it 'returns the user if the username is matched and the password entered matches that in database' do
      authenticated_user = User.authenticate(user.username, user.password)
      expect(authenticated_user).to eq subject
    end




  end

end
