require_relative '../../app/models/user'

describe User do
  let!(:user) do User.create(email: 'rosie@allott.com',
                name: 'Ral',
                username: 'Ral',
                password: 'my_password',
                password_confirmation: 'my_password')
              end

  context '#authenticate' do
    it 'fails authentication if email not known' do
      expect(User.authenticate('none@allott.com','my_password')).to eq false
    end
    it 'fails authentication if password not correct' do
      expect(User.authenticate('rosie@allott.com','not_my_password')).to eq false
    end
    it 'passes authentication if email and password correct' do
      expect(User.authenticate('rosie@allott.com','my_password')).to eq user
    end
  end
end
