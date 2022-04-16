require 'database_helpers'

describe '.create' do
  it 'creates a new user' do
    user = User.create(username: 'Bob', name: 'Bob Bob', email: 'bob@bob.com', password: 'notbob')

    persisted_data = persisted_data(table: 'users', id: user.id)

    expect(user).to be_a User
    expect(user.id).to eq persisted_data.first['id']
    expect(user.username).to eq 'Bob'
    expect(user.name).to eq 'Bob Bob'
    expect(user.email).to eq "bob@bob.com"
    expect(user.password).to eq 'notbob'
  end
end