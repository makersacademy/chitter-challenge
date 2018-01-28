describe User do

  let!(:user) do
    User.create(username:'Batman', email:'cleo@email.com', password:'password1')
  end

  it "Should authenticate when given a valid email" do
    authenticated_user = User.authenticate('cleo@email.com', 'password1')
    expect(authenticated_user).to eq user
  end
end
