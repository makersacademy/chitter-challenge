require 'user'

describe 'Sign Up' do

  it 'creates a user with given details' do
    user = User.sign_up(name: 'a name', email: 'an email', username: 'a username', password: 'a password')

    expect(user.id).to be > 0
    expect(user.name).to eq 'a name'
    expect(user.email).to eq 'an email'
    expect(user.username).to eq 'a username'
  end

  it 'persits a user with given details' do
    User.sign_up(name: 'a name', email: 'an email', username: 'a username', password: 'a password')

    result = PG.connect(dbname: 'chitter_test').exec('SELECT * FROM users')

    expect(result.count).to eq 1
    expect(result[0]["name"]).to eq 'a name'
    expect(result[0]["email"]).to eq 'an email'
    expect(result[0]["username"]).to eq 'a username'
    expect(result[0]["password"]).to eq 'a password'
  end

  it 'fails to create a user with duplicate username' do
    User.sign_up(name: 'a name', email: 'an email', username: 'a username', password: 'a password')

    expect { User.sign_up(name: 'another name', email: 'another email', username: 'a username', password: 'another password') }.to raise_error
  end

  it 'fails to create a user with duplicate email' do
    User.sign_up(name: 'a name', email: 'an email', username: 'a username', password: 'a password')

    expect { User.sign_up(name: 'another name', email: 'an email', username: 'another username', password: 'another password') }.to raise_error
  end

end
