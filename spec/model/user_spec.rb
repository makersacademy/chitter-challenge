describe 'User' do

  let!(:user) do
    User.create(email: 'test@test.com',
                name: 'Testy McTest',
                user_name: 'Test1',
                password: '123456',
                password_confirmation: '123456')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    puts authenticated_user
    expect(authenticated_user).to eq(user)
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'Wrong_password')).to be_nil
  end

end
