require_relative '../../app/models/user.rb'

describe User do

  let!(:registered_user) { User.create(email: 'enzo@email.com',
                                      name: 'Crescenzo D\'Alterio',
                                      username: 'alterenzo',
                                      password: 'secure_password',
                                      password_confirmation: 'secure_password')}

  describe '.authenticate' do
    it 'returns the registered user, if logging with correct credentials' do
      user = User.authenticate(email: 'enzo@email.com', password: 'secure_password')
      expect(user).to eq registered_user
    end

    it 'returns nil if logging with incorrect credentials' do
      user = User.authenticate(email: 'enzo@email.com', password: '123')
      expect(user).to be_nil
    end
  end
end
