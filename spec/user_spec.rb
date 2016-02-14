require_relative '../app/models/user'

xdescribe 'User' do
  subject(:user){User.create(name: 'Emma', username: 'emmab', email: 'emma@email.com', password: 'password', password_confirmation: 'password')}

  describe '#authenticate' do

    it 'returns the user if the username is matched and the password entered matches that in database' do
      expect(user.authenticate('emmab', 'password')).to eq(subject)
    end


  end

end
