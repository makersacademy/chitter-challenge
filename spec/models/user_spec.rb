describe User do

  it 'authenticates a valid handle and password' do
    user = create :user
    expect(User.authenticate(user.handle, user.password)).to eq user
  end

  it 'returns nil if authenticated with the wrong password' do
    user = create :user
    expect(User.authenticate(user.email, 'wrongness')).to eq nil
  end

  it 'refuses to save without a name' do
    user = build :user, name: ''
    user.save
    expect(user.errors.full_messages).to include 'Name must not be blank'
  end

  it 'refuses to save without an email' do
    user = build :user, email: ''
    user.save
    expect(user.errors.full_messages).to include 'Email must not be blank'
  end

  it 'refuses to save without a handle' do
    user = build :user, handle: ''
    user.save
    expect(user.errors.full_messages).to include 'Handle must not be blank'
  end

end
