describe User do
  let!(:user) { User.create(name: 'test', email: 'test@gmail.com', password: '1234', password_confirmation: '1234') }
  it 'should authenticate a user when given a valid username and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'should not authenticate when given an unvalid password' do
    expect(User.authenticate(user.email, 'unvalid_password')).to eq nil
  end
end
