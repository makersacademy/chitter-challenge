describe User do

  before do
    created_user = User.create(
      email: "fly@high.com",
      password: "bowling1234",
      password_confirmation: "bowling1234",
      name: "The Dude",
      username: "thedude"
      )
  end

  it 'authenticates when given correct details' do
    authenticated_user = User.authenticate("thedude", "bowling1234")
    expect(authenticated_user.name).to eq "The Dude"
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate("thedude", "it_really_tied_the_room_together")).to be_nil
  end

end
