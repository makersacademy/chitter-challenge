describe User do

  let!(:user) do
    User.create(full_name: "Fred Bloggs",
                   user_name: "fredb",
                   email: "fred@bloggs.com",
                   password: "ABC123",
                   password_confirmation: "ABC123")
  end

  it 'authenticates when given a valid user_name and password' do
    authenticated_user = User.authenticate(user.user_name, user.password)
    expect(authenticated_user).to eq user
  end

end
