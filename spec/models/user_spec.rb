require_relative '../../app/models/user'

describe User do
  let!(:user) do User.create(email: 'rosie@allott.com',
                name: 'Ral',
                username: 'Ral',
                password: 'my_password',
                password_confirmation: 'my_password')
              end

  context '#authenticate' do
    it 'fails authentication if username not known' do
      expect(User.authenticate('none@allott.com','my_password')).to eq false
    end
  end
end
