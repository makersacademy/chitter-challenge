require 'user'

describe User do
  describe '.create' do
    it 'creates a new user with hashed password' do
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
      expect(test_user.authenticate('password123')).to eq test_user
      expect(test_user.authenticate('badpassword')).to eq false
    end  
  end

  describe '.handle' do
    it 'returns the user handle' do
      user_create_dave

      test_user = User.all.first

      expect(test_user.handle).to eq '@davedude'
    end
  end

  describe '.log_in' do
    it 'returns the user id if the credentials are correct' do
      user_create_dave

      test_user = User.all.first

      expect(User.log_in(email: 'davedude@example.com', password: 'password123')). to eq test_user.id
    end
  end
end