describe User do

  let!(:user) do
  User.create(name: 'Ben',
              email: 'test@test.com',
              password: 'secret1234',
              password_confirmation: 'secret1234')
  end

  it 'will authenticate user information' do
    user_auth = User.authenticate(user.email, user.password)
    expect(user_auth).to eq user
  end

  it 'will not authenticate invalid credentials' do
    expect(User.authenticate(user.email, '4321terces')).to be_nil
  end

end
