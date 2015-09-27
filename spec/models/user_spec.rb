describe User do
  it 'authenticates a valid handle and password' do
    user = create :user
    expect(User.authenticate(user.handle, user.password)).to eq user
  end
  it 'returns nil if authenticated with the wrong password' do
    user = create :user
    expect(User.authenticate(user.email, 'wrongness')).to eq nil
  end
end
