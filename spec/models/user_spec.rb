describe User do

  let!(:user) do
    User.create(
      email: "fly@high.com",
      password: "bowling1234",
      password_confirmation: "bowling1234",
      name: "The Dude",
      username: "thedude"
      )
  end

  it 'authenticates when given correct details' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.username, "it_really_tied_the_room_together")).to be_nil
  end

end
