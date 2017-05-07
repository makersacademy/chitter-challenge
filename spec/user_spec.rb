describe User do

  def create_user
      User.create(email_address: 'james@aol.com',
                  password: 'password',
                  password_confirmation: 'password',
                  user_name: 'james',
                  real_name: 'James Giant')
  end
    
  subject(:user) { create_user }
  before(:example) { create_user }
    
  describe '#create' do
    it 'saves user to database' do
      user_id = user.id
      expect(User.first(id: user_id)).to eq user
    end

    it 'encrypts password' do
      expect('password').to_not eq user.password_digest
    end

    it 'does not add user if confirm password fails' do
      User.create(email_address: 'john@gmail.com',
                  password: 'password',
                  password_confirmation: 'not_password',
                  user_name: 'john',
                  real_name: 'John Giant')
      expect(User.first(email_address: 'john@gmail.com')).to be_nil
    end

  end

  describe '#authenticate' do
    context 'email and password are correct' do
      it 'returns true' do
        expect(User.authenticate(email_address: 'james@aol.com', password: 'password')).to eq true
      end
    end
    context 'password is incorrect' do
      it 'returns false' do
        expect(User.authenticate(email_address: 'james@aol.com', password: 'wrong_password')).to eq false
      end
    end
    context 'no user with specified email address' do
      it 'returns false' do
        expect(User.authenticate(email_address: 'chocolate@rain.com', password: 'password')).to eq false
      end
    end
  end

end
