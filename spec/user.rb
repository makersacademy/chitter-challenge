describe User do

  let(:user) {User.create(email: 'test@test.com', password: 'secret1234',
               password_confirmation: 'secret1234')}

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

end
