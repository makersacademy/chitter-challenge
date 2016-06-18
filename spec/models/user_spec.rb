describe User do

  let!(:user) do
    User.create(email: 'marco@test.com', password: 'secret1234',
               password_confirmation: 'secret1234')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
  end

  it "saves a password recovery token when we generate a token" do
     expect{user.generate_token}.to change{user.password_token}
  end

end
