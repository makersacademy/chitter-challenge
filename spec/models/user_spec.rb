describe User do

  let!(:user) do
    User.create(full_name: 'John Doe',
                username: 'JohnnyD',
                email: 'johndoe@email.com',
                password: 'pass123',
                password_confirmation: 'pass123')
  end

  it 'authenticates with correct credentials' do
    authenticated_user = User.authenticate('johndoe@email.com', 'pass123')
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate with incorrect credentials' do
    inexistent_user = User.authenticate('johndoe@email.com', 'wrong password')
    expect(inexistent_user).to be_nil
  end
end
