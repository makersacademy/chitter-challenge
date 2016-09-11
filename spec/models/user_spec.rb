describe User do
  let!(:user) do
    User.create(username: 'mrmurtz',
                email: 'murtz@gmail.com',
                password:  '1234',
                password_confirmation: '1234')
  end

  it "authenticates a user with a valid username and password" do
    authentic_user = User.authenticate(user.email, user.password)
    expect(authentic_user).to eq user
  end

end
