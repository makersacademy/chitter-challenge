require 'database_helpers'

describe '.create' do
  it 'creates a new user' do
    user = User.create(name: 'John Doe', username:'Rodeo',email: 'test@example.com', password: 'password123')

    persisted_data = persisted_data(table: :users, id: user.id)

    expect(user).to be_a User
    expect(user.id).to eq persisted_data.first['id']
    expect(user.name).to eq 'John Doe'
    expect(user.username).to eq 'Rodeo'
    expect(user.email).to eq 'test@example.com'
  end
end
