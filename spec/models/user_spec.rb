describe User do

  let(:user) do
    create(:user)
  end

  it 'requires a matching confirmation password' do
    user = build(:user, password_confirmation: "wrong")
    expect { sign_up(user) }.not_to change(User, :count)
  end

  it 'authenticates when given an valid username and password' do
    authenticated_user = User.authenticate(username: user.username, password: user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticates when given an invalid username' do
    authenticated_user = User.authenticate(username: 'wrong', password: user.password)
    expect(authenticated_user).to be_nil
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(username: user.username, password: 'wrong_password')).to be_nil
  end
end
