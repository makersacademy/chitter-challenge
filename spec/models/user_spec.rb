describe User do

  before do
    sign_up
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate('sam@makersacademy.com', 's3cr3t')
    expect(authenticated_user.username).to eq 'tansaku'
  end

  it 'does not authenticate when given incorrect password' do
    expect(User.authenticate('sam@makersacademy.com', 'wrong_stupid_password')).to be_nil
  end

end
