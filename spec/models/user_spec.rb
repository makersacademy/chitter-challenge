describe User do

  subject(:user) {
    described_class.new(
      id: 1,
      username: 'fakeuser',
      email: 'fake@fake.com',
      encrypted_password: 'password'
    )
  }

  it 'is not valid without a username' do
    user.username = nil
    expect(user).to_not be_valid
  end

  it 'is not valid without an email' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user.encrypted_password = nil
    expect(user).to_not be_valid
  end

end
