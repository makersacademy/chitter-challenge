describe User do

  let!(:user) do
    User.create(email: 'hello@hello.com', password: 'pass1234', password_confirmation: 'pass1234')
  end

  it 'signs in an authenticated user' do
    authenticated_user = User.autheticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'doesnt sign in with incorrect credentials' do
    expect(User.authenticate(user.email, 'wrong_pass')).to be nil
  end
end
