describe User do
  let!(:user) do
    User.create(email: 'example@example.com',
                user_name: 'example',
                password: 'password',
                password_confirmation: 'password' )
  end

  it 'authenticates users when email and password are correct' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it "doesn't authenticate the user when email and password are incorrect" do
    expect(User.authenticate(user.email, 'wrong')).to be_nil
  end
end
