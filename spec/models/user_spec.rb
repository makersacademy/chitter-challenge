describe User do
  let!(:user) do
    described_class.create(email: 'foo@bar.com', password: 'secret1234',
                           password_confirmation: 'secret1234', name: 'Foo Bar',
                           user_name: 'foobar')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = described_class.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(described_class.authenticate(user.email, 'wrong_password')).to be_nil
  end
end
