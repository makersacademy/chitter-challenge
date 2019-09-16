require 'user'

describe User do
  it 'should successfully login with correct password' do
    User.signup(
      username: 'abc123',
      email: 'abc123@testemail.com',
      password: '12345678'
    )
    success = User.login(
      username: 'abc123',
      password: '12345678'
    )
    expect(success).to eq true
  end

  it 'should fail login with wrong password' do
    User.signup(
      username: 'abc123',
      email: 'abc123@testemail.com',
      password: '12345678'
    )
    success = User.login(
      username: 'abc123',
      password: '123456'
    )
    expect(success).to eq false
  end

  it 'should fail login with missing user' do
    success = User.login(
      username: 'abc123',
      password: '12345678'
    )
    expect(success).to eq false
  end

  it 'should fail signup if username exists' do
    User.signup(
      username: 'abc123',
      email: 'abc123@testemail.com',
      password: '12345678'
    )
    success = User.signup(
      username: 'abc123',
      email: 'abc123@testemail.com',
      password: '12345678'
    )
    expect(success).to eq false
  end
end
