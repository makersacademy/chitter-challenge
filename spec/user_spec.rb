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

  describe '.authenticate' do
    it 'returns the user id if the credentials are correct' do
      user_create_dave

      test_user = User.all.first

      expect(User.authenticate(email: 'davedude@example.com', password: 'password123')). to eq test_user.id
    end

    it 'returns nil if the email is not found' do
      user_create_dave

      test_user = User.all.first

      expect(User.authenticate(email: 'wrongemail@example.com', password: 'password123')). to eq nil
    end

    it 'returns nil if the wrong password is used for an existing email' do
      user_create_dave

      test_user = User.all.first

      expect(User.authenticate(email: 'davedude@example.com', password: 'incorrect')). to eq nil
    end
  end
end