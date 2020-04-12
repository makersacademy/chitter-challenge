require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      User.create(
        first_name: 'Dave',
        last_name: 'Dude',
        email: 'davedude@example.com',
        user_name: 'davedude',
        password: 'password123'
      )
      
      test_user = User.all.first

      expect(test_user.first_name).to eq 'Dave'
      expect(test_user.last_name).to eq 'Dude'
      expect(test_user.email).to eq 'davedude@example.com'
      expect(test_user.user_name).to eq 'davedude'
      expect(test_user.password).to eq 'password123'
    end
  end
end