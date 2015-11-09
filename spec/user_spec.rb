describe User do

  let!(:user) do
    User.create(name: 'Ezzy Elliott',
                username: 'ezzye',
                email: 'ezzy.elliott@gmail.com',
                password: '123456',
                password_confirmation: '123456'
                )
  end

  let!(:user1) do
    User.create(name: 'Bob Elliott',
                username: 'bob',
                email: 'bob.elliott@gmail.com',
                password: '123457',
                password_confirmation: '123457'
                )
  end

  describe 'Adds users to model' do
    it 'first name user' do
      expect(User.first.username).to eq 'ezzye'
    end
    it 'first name user1' do
      expect(User.last.username).to eq 'bob'
    end
  end


  it 'authenticates when given a valid sign up credentials and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticates when given a wrong password' do
    authenticated_user = User.authenticate(user.username, 'wrong_password')
    expect(authenticated_user).to be_nil
  end

end