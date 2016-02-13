describe User do
  let(:user) do
    User.create(
      name: "Bob",
      username: "bigbob",
      email: "Bob@email.com",
      password: "123abc",
      password_confirmation: "123abc"     
    )
  end 

  it 'authenticates users by email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end 

  it 'does not authenticate when password is incorrect' do
    expect(User.authenticate(user.email, "incorrect")).to be_nil
  end
end
