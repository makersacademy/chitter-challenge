describe User do
  let(:user) { create(:user) }
  it 'authenticates a user with valid information' do
    expect(User.authenticate(user.email, user.password)).to eq(user)
  end

  it 'does not authenticate with invalid email' do
    expect(User.authenticate('wrong@email.com', user.password)).to be_nil
  end

  it 'does not authenticate with invalid password' do
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end
end
