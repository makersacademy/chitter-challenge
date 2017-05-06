describe User do
  subject(:user) do
      User.create(email_address: 'james@aol.com',
                  password: 'password',
                  user_name: 'james',
                  real_name: 'James Giant')
  end
    
  describe '#create' do

    it 'saves user to database' do
      user_id = user.id
      expect(User.first(id: user_id)).to eq user
    end

    it 'encrypts password' do
      expect('password').to_not eq user.password_digest
    end
  end

end
