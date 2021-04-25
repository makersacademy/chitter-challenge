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
end
