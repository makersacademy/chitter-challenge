require 'user'

describe User do
  it 'create adds user to db' do
    User.create(email: 'test_email',
      password: 'test_password',
      name: 'test_name',
      username: 'test_username'
    )
    expect(User.first.email).to eq 'test_email'
    expect(User.first.password).to eq 'test_password'
    expect(User.first.name).to eq 'test_name'
    expect(User.first.username).to eq 'test_username'
  end

  it 'create not valid is email is not unique' do
    User.create(email: 'test_email', password: 'test_password', name: 'test_name', username: 'test_username')
    u = User.create(email: 'test_email', password: 'test_password', name: 'test_name', username: 'test_username1')
    expect(u.valid?).to be false
  end

  it 'create not valid is username is not unique' do
    User.create(email: 'test_email', password: 'test_password', name: 'test_name', username: 'test_username')
    u = User.create(email: 'test_email1', password: 'test_password', name: 'test_name', username: 'test_username')
    expect(u.valid?).to be false
  end

  it 'valid_login? returns true if username and password match' do
    User.create(email: 'test_email', password: 'test_password', name: 'test_name', username: 'test_username')
    expect(User.valid_login?('test_username', 'test_password')).to be true
  end

  it 'valid_login? returns false if username does not match' do
    User.create(email: 'test_email', password: 'test_password', name: 'test_name', username: 'test_username')
    expect(User.valid_login?('aaaa', 'test_password')).to be false
  end

  it 'valid_login? returns false if password does not match' do
    User.create(email: 'test_email', password: 'test_password', name: 'test_name', username: 'test_username')
    expect(User.valid_login?('test_username', 'aaaa')).to be false
  end
end
