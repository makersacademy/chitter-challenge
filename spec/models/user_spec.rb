require './app/models/user'



describe User do


  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate("Agatina", "password")
    expect(authenticated_user).to eq user
  end

end
